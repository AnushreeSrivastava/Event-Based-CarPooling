import json, unittest, datetime
from Userdata import userData

class FlaskTestCase(unittest.TestCase):

    def setUp(self): #python setup function to setup data for test
        self.keyerror = {"status":"error", "message":"Error with provided user data. One or more keys are not present", "code":1237}
        self.indexerror = {"status":"error", "message":"Error with provided user data. tuple index out of range", "code":1247}
        self.outputdata1 = [{'username':'rakgunti26', 'name': 'rakesh gunti', 'contact': '704-819-17', 'email': 'gunti@uncc.edu'}], [{'ride_id':'137'}], [{'ride_id':'138'}]
        self.userdata1 = userData([], [], [])
        self.userdata2 = userData([], [{'RIDE_ID':'137'}], [{'RIDE_ID':'138'}])
        self.userdata3 = userData([{'USERNAME':'rakgunti26'}], [{'RIDE_ID':'137'}], [{'RIDE_ID':'138'}])
        self.userdata4 = userData([{'USERNAME':'rakgunti26', 'NAME': 'rakesh gunti', 'CONTACT_NO': '704-819-17', 'EMAIL_ID': 'gunti@uncc.edu'}], [], [])
        self.userdata5 = userData([{'USERNAME':'rakgunti26', 'NAME': 'rakesh gunti', 'CONTACT_NO': '704-819-17', 'EMAIL_ID': 'gunti@uncc.edu'}], [{'RIDE_ID':'137'}], [{'RIDE_ID':'138'}])
        self.userdata6 = userData([{'USERNAME': 'rakgunti26', 'NAME': 'rakesh gunti', 'CONTACT_NO': '704-819-17', 'EMAIL_ID': 'gunti@uncc.edu'}], [{'HOST_USERNAME': 'rakgunti26', 'HOST_NAME': 'Alberik Mertel', 'HOST_CONTACT': '6994341826', 'HOST_EMAIL': 'amertel12@sohu.com', 'RIDE_ID': 137, 'EVENT_ID': '4704993', 'PASSENGER_USERNAME': 'amertel12', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 40, 'STATUS': 'pending', 'START_TIME': datetime.datetime(2019, 11, 6, 1, 21, 10), 'EVENT_NAME': 'Eiffel Tower Experience - Las Vegas', 'DATE_TIME': datetime.datetime(2019, 11, 5, 3, 30), 'ADDRESS': '3655 Las Vegas Boulevard SouthLas Vegas, NV 89109'}, {'HOST_USERNAME': 'aoheffernan3', 'HOST_NAME': "Audrie O'Heffernan", 'HOST_CONTACT': '7149098982', 'HOST_EMAIL': 'aoheffernan3@last.fm', 'RIDE_ID': 139, 'EVENT_ID': '4704993', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 41, 'STATUS': 'pending', 'START_TIME': datetime.datetime(2019, 11, 6, 1, 21, 30), 'EVENT_NAME': 'Eiffel Tower Experience - Las Vegas', 'DATE_TIME': datetime.datetime(2019, 11, 5, 3, 30), 'ADDRESS': '3655 Las Vegas Boulevard SouthLas Vegas, NV 89109'}, {'HOST_USERNAME': 'AnuSrivastava33', 'HOST_NAME': 'Anushree Srivastava', 'HOST_CONTACT': '999-999-1234', 'HOST_EMAIL': 'asri@uncc.edu', 'RIDE_ID': 182, 'EVENT_ID': '5096273', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 51, 'STATUS': 'declined', 'START_TIME': datetime.datetime(2019, 11, 24, 20, 0), 'EVENT_NAME': 'DJ TJ', 'DATE_TIME': datetime.datetime(2019, 11, 24, 3, 30), 'ADDRESS': '917 Saint Catherine StreetMontreal, Canada'}, {'HOST_USERNAME': 'AnuSrivastava33', 'HOST_NAME': 'Anushree Srivastava', 'HOST_CONTACT': '999-999-1234', 'HOST_EMAIL': 'asri@uncc.edu', 'RIDE_ID': 183, 'EVENT_ID': '5096273', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 52, 'STATUS': 'accepted', 'START_TIME': datetime.datetime(2019, 11, 24, 20, 30), 'EVENT_NAME': 'DJ TJ', 'DATE_TIME': datetime.datetime(2019, 11, 24, 3, 30), 'ADDRESS': '917 Saint Catherine StreetMontreal, Canada'}], [{'HOST_USERNAME': 'amertel12', 'HOST_NAME': 'Alberik Mertel', 'HOST_CONTACT': '6994341826', 'HOST_EMAIL': 'amertel12@sohu.com', 'RIDE_ID': 137, 'EVENT_ID': '4704993', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 40, 'STATUS': 'pending', 'START_TIME': datetime.datetime(2019, 11, 6, 1, 21, 10), 'EVENT_NAME': 'Eiffel Tower Experience - Las Vegas', 'DATE_TIME': datetime.datetime(2019, 11, 5, 3, 30), 'ADDRESS': '3655 Las Vegas Boulevard SouthLas Vegas, NV 89109'}, {'HOST_USERNAME': 'aoheffernan3', 'HOST_NAME': "Audrie O'Heffernan", 'HOST_CONTACT': '7149098982', 'HOST_EMAIL': 'aoheffernan3@last.fm', 'RIDE_ID': 139, 'EVENT_ID': '4704993', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 41, 'STATUS': 'pending', 'START_TIME': datetime.datetime(2019, 11, 6, 1, 21, 30), 'EVENT_NAME': 'Eiffel Tower Experience - Las Vegas', 'DATE_TIME': datetime.datetime(2019, 11, 5, 3, 30), 'ADDRESS': '3655 Las Vegas Boulevard SouthLas Vegas, NV 89109'}, {'HOST_USERNAME': 'AnuSrivastava33', 'HOST_NAME': 'Anushree Srivastava', 'HOST_CONTACT': '999-999-1234', 'HOST_EMAIL': 'asri@uncc.edu', 'RIDE_ID': 182, 'EVENT_ID': '5096273', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 51, 'STATUS': 'declined', 'START_TIME': datetime.datetime(2019, 11, 24, 20, 0), 'EVENT_NAME': 'DJ TJ', 'DATE_TIME': datetime.datetime(2019, 11, 24, 3, 30), 'ADDRESS': '917 Saint Catherine StreetMontreal, Canada'}, {'HOST_USERNAME': 'AnuSrivastava33', 'HOST_NAME': 'Anushree Srivastava', 'HOST_CONTACT': '999-999-1234', 'HOST_EMAIL': 'asri@uncc.edu', 'RIDE_ID': 183, 'EVENT_ID': '5096273', 'PASSENGER_USERNAME': 'rakgunti26', 'PASSENGER_NAME': 'rakesh gunti', 'PASSENGER_CONTACT': '704-819-17', 'PASSENGER_EMAIL': 'gunti@uncc.edu', 'REQUEST_ID': 52, 'STATUS': 'accepted', 'START_TIME': datetime.datetime(2019, 11, 24, 20, 30), 'EVENT_NAME': 'DJ TJ', 'DATE_TIME': datetime.datetime(2019, 11, 24, 3, 30), 'ADDRESS': '917 Saint Catherine StreetMontreal, Canada'}])
    
    def test_getUserData_neg(self):
        self.assertDictEqual( self.userdata1.getUserData(),self.indexerror) #checking if index error is being provided
        self.assertEqual( self.userdata1.getUserData()["status"],self.indexerror["status"]) #check the status for index error 
        self.assertEqual( self.userdata1.getUserData()["code"],self.indexerror["code"])  #check the code for index error 
        
        self.assertDictEqual( self.userdata2.getUserData(),self.indexerror)  #checking if index error is being provided
        self.assertEqual( self.userdata2.getUserData()["message"],self.indexerror["message"]) #check the message for index error 
        
        self.assertDictEqual( self.userdata3.getUserData(),self.keyerror) ##checking if index error is being provided 
        self.assertEqual( self.userdata3.getUserData()["message"],self.keyerror["message"]) #check the message for key error 
        self.assertEqual( self.userdata3.getUserData()["status"],self.keyerror["status"]) #check the status for key error 
        self.assertEqual( self.userdata3.getUserData()["code"],self.keyerror["code"]) #check the code for key error 
        
        self.assertListEqual( list(self.userdata4.getUserData().keys()), ['user', 'offered_rides', 'requested_rides'])
        self.assertListEqual( list(self.userdata4.getUserData()['user']), ['username', 'name', 'contact', 'email'])
        self.assertNotEqual( self.userdata4.getUserData()['user'], {})
        self.assertListEqual( self.userdata4.getUserData()['offered_rides'], [])
        self.assertListEqual( self.userdata4.getUserData()['requested_rides'], [])

        self.assertListEqual( list(self.userdata5.getUserData().keys()), ['user', 'offered_rides', 'requested_rides'])
        self.assertEqual( self.userdata5.getUserData()['requested_rides'], [])
        self.assertEqual( self.userdata5.getUserData()['offered_rides'], [])
        self.assertEqual( self.userdata5.getUserData()['user']['username'], 'rakgunti26')
    
    def test_getUserData_pos(self):
        self.assertListEqual( list(self.userdata6.getUserData().keys()), ['user', 'offered_rides', 'requested_rides'])
        self.assertNotEqual( self.userdata6.getUserData()['requested_rides'], [])
        self.assertNotEqual( self.userdata6.getUserData()['offered_rides'], [])
        self.assertEqual( self.userdata6.getUserData()['user']['username'], 'rakgunti26')
        self.assertNotEqual( self.userdata6.getUserData()['requested_rides'][0]['username'], 'rakgunti26') # Making sure requested rides username is not given username
    
    def tearDown(self): #to remove data that is initialized for testing
        self.keyerror = None
        self.indexerror = None
        self.outputdata1 = None
        self.userdata1 = None
        self.userdata2 = None
        self.userdata3 = None
        self.userdata4 = None
        self.userdata5 = None
        self.userdata6 = None

if __name__ == "__main__":
    unittest.main()