import random, hashlib
from Models.Userdata import userData
import json, collections, datetime
import Seat_Geek_API as SGE


class DBController:
    def __init__(self, cursor, mysql):
        self.cursor = cursor
        self.mysql = mysql

    def getUser(self, username):

        self.cursor.execute(
            'SELECT * FROM USER_PROFILE WHERE USERNAME = "%s"' % (username)
        )  # To retrieve user profile data for user page
        user_data = self.cursor.fetchall()
        print("user_data", user_data)

        self.cursor.execute(
            'SELECT * FROM REQUESTS WHERE STATUS in ("accepted","pending") and HOST_USERNAME="%s"'
            % (username)
        )  # To retrieve data of all requests to user hosted rides
        offered_data = self.cursor.fetchall()
        print("offered_data", offered_data)

        self.cursor.execute(
            'SELECT * FROM REQUESTS WHERE PASSENGER_USERNAME="%s"' % (username)
        )  # To retrieve data of all requests made by user to other rides
        requested_data = self.cursor.fetchall()
        print("requested_data", requested_data)

        user_model = userData(user_data, offered_data, requested_data)
        resp = user_model.getUserData()
        return resp

    def saveRequest(self, RideID, eventID, userID, status):
        self.cursor.execute(
            """INSERT INTO RIDES_REQUESTED (RIDE_ID,EVENT_ID,USERNAME,STATUS) VALUES(%s,%s,%s,%s)""",
            (RideID, eventID, userID, status),
        )
        self.mysql.commit()
        print("Data Saved!")

    def updateRequest(
        self, requestId, status
    ):  # To update the status of the request to ride
        self.cursor.execute(
            """UPDATE RIDES_REQUESTED SET STATUS=%s WHERE REQUEST_ID=%s""",
            (status, requestId),
        )
        self.mysql.commit()
        self.cursor.execute(
            "SELECT STATUS FROM REQUESTS WHERE REQUEST_ID=%s" % (requestId)
        )
        return status

    def getrides_wo_username(
        self, eventId
    ):  # to send offered rides data when eventId is provided
        data = []
        self.cursor.execute(
            """ 
        SELECT U.FIRST_NAME, U.LAST_NAME, RO.EVENT_ID, RO.RIDE_ID, RO.USERNAME, RO.START_TIME   
            FROM RIDES_OFFERED AS RO INNER JOIN USER AS U 
            ON U.USERNAME = RO.USERNAME AND RO.EVENT_ID=%s""",
            [eventId],
        )
        ridesdata = self.cursor.fetchall()
        print(ridesdata)
        for ride in ridesdata:
            d = collections.OrderedDict()
            d["FIRST_NAME"] = ride["FIRST_NAME"]
            d["LAST_NAME"] = ride["LAST_NAME"]
            d["EVENT_ID"] = ride["EVENT_ID"]
            d["RIDE_ID"] = ride["RIDE_ID"]
            d["USERNAME"] = ride["USERNAME"]
            d["START_TIME"] = ride["START_TIME"].strftime("%d-%m-%Y %H:%M:%S")
            data.append(d)
        final_dat = json.dumps(data)
        return final_dat

    def getrides_username(
        self, eventId, userId
    ):  # to send offered rides data when eventId and userId is provided

        data = []
        self.cursor.execute(
            """ 
        SELECT RO.EVENT_ID, RO.RIDE_ID, RO.USERNAME, RO.START_TIME, RR.STATUS
        FROM (SELECT * FROM RIDES_OFFERED WHERE EVENT_ID= %s AND USERNAME NOT IN (%s) ) AS RO 
        LEFT OUTER JOIN RIDES_REQUESTED AS RR ON RR.RIDE_ID = RO.RIDE_ID AND RR.USERNAME=%s""",
            [eventId, userId, userId],
        )
        ridesdata = self.cursor.fetchall()
        for ride in ridesdata:
            print(ride)
            d = collections.OrderedDict()
            d["EVENT_ID"] = ride["EVENT_ID"]
            d["RIDE_ID"] = ride["RIDE_ID"]
            d["USERNAME"] = ride["USERNAME"]
            d["START_TIME"] = ride["START_TIME"].strftime("%d-%m-%Y %H:%M:%S")
            d["STATUS"] = ride["STATUS"] or "NULL"
            data.append(d)
        final_dat = json.dumps(data)
        return final_dat

    def enterUser(self, data):
        print()
        print("!!In enterUser!!")
        # Generate username
        userName = (
            data["firstName"][:3] + data["lastName"] + str(random.randint(10, 99))
        )

        # Generate password Hash
        hashed_password = (hashlib.md5(data["password"].encode())).hexdigest()
        print("password hex is", hashed_password)

        try:
            self.cursor.execute(
                'Select * from USER where EMAIL_ID ="%s"' % (data["email"])
            )
            response = self.cursor.fetchall()
            print("Select resp", response)
            if response:
                return "Email already present. Try a new email-id"
            else:
                self.cursor.execute(
                    'INSERT INTO USER (USERNAME, PASSWORD, FIRST_NAME, LAST_NAME, CONTACT_NO, EMAIL_ID ) VALUES ("%s", "%s", "%s", "%s", "%s", "%s")'
                    % (
                        userName,
                        hashed_password,
                        data["firstName"],
                        data["lastName"],
                        data["phoneNumber"],
                        data["email"],
                    )
                )
                self.mysql.commit()
                return "Success"
        except Exception as e:
            return "error:" + str(e)

    def saveOfferRide(self, data):
        try:

            # get data from event api
            event = SGE.Seat_Geek_Api()
            eventdata = event.getEvent(data["eventId"])
            print('data', data)

            # append user selected time to the event date and convert it to datetime
            eventDate = datetime.datetime.strptime(
                data["eventDate"], "%Y-%m-%d %H:%M:%S"
            )
            temp_start_datetime = (
                str(eventDate.date()) + " " + data["startTime"] + ":00"
            )
            start_datetime = datetime.datetime.strptime(
                temp_start_datetime, "%Y-%m-%d %H:%M:%S"
            )
            
            # get all the rows from events table for the given eventID
            self.cursor.execute('select * from EVENTS where EVENT_ID ="%s"' % data["eventId"])
            response = self.cursor.fetchall()

            #Skip inserting into EVENTS table if row is already present for that eventID
            if not response:
                # Save data to event table
                self.cursor.execute(
                """INSERT INTO EVENTS (EVENT_ID,EVENT_NAME,FULL_ADDRESS,DESCRIPTION,PERFORMERS_NAMES,PERFORMERS_ID,VENUE_ID,DATE_TIME_LOCAL
                    ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s)""",
                (
                    eventdata["id"],
                    eventdata["title"],
                    eventdata["full_address"],
                    eventdata["description"],
                    eventdata["performers_names"],
                    eventdata["performers_ids"],
                    eventdata["venue_id"],
                    eventdata["datetime_local"],
                ),
                )

            # Save data into the offered rides table
            self.cursor.execute(
                """INSERT INTO RIDES_OFFERED (EVENT_ID,USERNAME,CAR_MODEL,NO_OF_SEATS,START_TIME,START_ADDRESS_LINE1,START_ADDRESS_LINE2,START_CITY,START_STATE,START_ZIP_CODE
                    ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""",
                (
                    data["eventId"],
                    data["username"],
                    data["carModel"],
                    data["noOfSeats"],
                    start_datetime,
                    data["address1"],
                    data["address2"],
                    data["city"],
                    data["state"],
                    data["zipCode"],
                ),
            )
            self.mysql.commit()
            print("Data Saved!")
            return "Success"
        except Exception as e:
            return "error:" + str(e)

    def Userlogin(self,email,password):

        #  cur = mysql.connection.cursor()
        # email = request.get_json()['email']
        # password = request.get_json()['password'].encode('utf-8')
        # result = ""
    
        self.cursor.execute("SELECT * FROM USER where email_id = '" + str(email) + "'")

        rv = self.cursor.fetchone()

        return rv
