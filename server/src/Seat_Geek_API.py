import requests, json
from requests.exceptions import HTTPError
from API_Interfaces import API_get_Interface 
from Preprocess_data import preprocess

class Seat_Geek_Api(API_get_Interface): #Seatgeek api class from api interface class
    def __init__(self):
        with open('Api_config.json') as Apiconfig:  #assigning Seat Geek Data
            Apiconfigdata = json.load(Apiconfig)["SG"]
            self.params = Apiconfigdata["params"]
            self.api_url_base = Apiconfigdata["api_url_base"]
            self.header = Apiconfigdata["header"]
        
    def getallEvents(self): # to get all events
        self.api_end_point = 'events' #this valriable should change depending on method called
        try:
            response = requests.get(self.api_url_base+self.api_end_point, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            return response.json() #returning response in json format
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except Exception as err:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}

    def getEvent(self, eventId): # to get an event with an eventid
        self.api_end_point = 'events' #this valriable should change depending on method called
        try:
            response = requests.get(self.api_url_base+self.api_end_point+"/"+eventId, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            dataprep = preprocess(response.json())
            return dataprep.Event_page_data()
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}
        
    
    def getByQuery(self, query): # to get all venues events
        print('In getByQuery fucntion!!!')    
        self.api_end_point = 'events?q=' #this valriable should change depending on method called
        print('url will be', self.api_url_base + self.api_end_point + query)
        try:
            response = requests.get(self.api_url_base + self.api_end_point + query, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            return {'events': []} if response.json()['events'] == [] else response.json()
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}

    def getByVenue(self, city): #to get events from a given venue
        print('In getByVenue fucntion!!!')
        self.api_end_point = 'events?venue.city=' #this valriable should change depending on method called
        try:
            response = requests.get(self.api_url_base + self.api_end_point + city, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            return response.json() #returning response in json format
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}
    
    def getByDate(self, date): # gets events of some performers
        print('In getByDate fucntion!!!')    
        self.api_end_point = 'events?datetime_utc.gte=' #this valriable should change depending on method called
        try:
            response = requests.get(self.api_url_base + self.api_end_point + date, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            return response.json() #returning response in json format
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}

    def getByPerformer(self, performer): # gets events of given performer
        print('In getByPerformer fucntion!!! Performer is', performer)
        self.api_end_point = 'events?performers.slug=' #this valriable should change depending on method called
        try:
            response = requests.get(self.api_url_base + self.api_end_point + performer, headers=self.header, params=self.params) #get request to api
            response.raise_for_status() # No exception will be raised when the request is successful
            return response.json() #returning response in json format
        except requests.exceptions.HTTPError as err:
            return {"status": "error", "message": err}
        except:
            return {"status": "error", "message": "Data Processing Issue", "code": 808}