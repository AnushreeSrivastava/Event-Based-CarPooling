import json

class userData():
    def __init__(self, user_data, offered_data, requested_data):
        self.data = {}
        self.data['user'] = {}
        self.data['offered_rides'] = []
        self.data['requested_rides'] = []
        try:
            if ["USERNAME", "NAME", "CONTACT_NO", "EMAIL_ID"] == list(user_data[0].keys()):
                self.data['user'] = {
                    'username': user_data[0]["USERNAME"],
                    'name': user_data[0]["NAME"],
                    'contact': user_data[0]["CONTACT_NO"],
                    'email': user_data[0]["EMAIL_ID"]
                }
            else:
                raise KeyError('One of keys required is not present in for given user data')

            try:
                for d in offered_data:
                    self.data['offered_rides'].append({
                        'ride_id': d["RIDE_ID"],
                        'event_id': d["EVENT_ID"],
                        'name': d["PASSENGER_NAME"],
                        'username': d["PASSENGER_USERNAME"],
                        'contact_no': d['PASSENGER_CONTACT'],
                        'email': d['PASSENGER_EMAIL'],
                        'status': d['STATUS'],
                        'request_id': d['REQUEST_ID'],
                        'event_name':d['EVENT_NAME'],
                        'date_time':d['DATE_TIME'].strftime("%d-%m-%Y %H:%M:%S"),
                        'address':d['ADDRESS']
                    })
            except:
                pass

            try:
                for d in requested_data:
                    self.data['requested_rides'].append({
                        'ride_id': d["RIDE_ID"],
                        'event_id': d["EVENT_ID"],
                        'name': d["HOST_NAME"],
                        'username': d["HOST_USERNAME"],
                        'contact_no': d['HOST_CONTACT'],
                        'email': d['HOST_EMAIL'],
                        'status': d["STATUS"],
                        'request_id': d['REQUEST_ID'],
                        'event_name':d['EVENT_NAME'],
                        'date_time':d['DATE_TIME'].strftime("%d-%m-%Y %H:%M:%S"),
                        'address':d['ADDRESS']
                    })
            except:
                pass
        
        except KeyError as e:
            self.data = {"status":"error", "message":"Error with provided user data. One or more keys are not present", "code":1237}
        except IndexError as e:
            self.data = {"status":"error", "message":"Error with provided user data. tuple index out of range", "code":1247}
        except:
            self.data = {"status":"error", "message":"Error while formatting user profile data.", "code":1037}

    def getUserData(self):
        return json.loads(json.dumps(self.data))