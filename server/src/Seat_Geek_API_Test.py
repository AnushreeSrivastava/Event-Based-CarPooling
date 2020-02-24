import unittest, requests
from Seat_Geek_API import Seat_Geek_Api
from API_Interfaces import API_get_Interface
from Preprocess_data import preprocess

class Seat_Geek_Api_test(unittest.TestCase):
    def setUp(self):
        self.Api1 = Seat_Geek_Api()
    
    def tearDown(self):
        pass

    def test_class_instance(self):
        self.assertIsInstance(self.Api1, API_get_Interface)
        self.assertNotIsInstance(self.Api1, preprocess)

    def testpos_getallEvents(self):
        alleventsdata = self.Api1.getallEvents()
        self.assertGreater(len(alleventsdata), 1)
        self.assertTrue(len(self.Api1.getallVenues()))


    def testneg_getEvent(self):
        self.assertTrue(self.Api1.getEvent("1")["status"], "error")

    def testpos_getEvent(self):
        self.assertTrue(len(self.Api1.getEvent("4958532")))
        self.assertEqual(self.Api1.getEvent("4958533")["id"], 4958533)
        self.assertEqual(self.Api1.getEvent("4958533")["title"], "Posty Fest featuring Post Malone")

    def testpos_getallVenues(self):
        allvenuesdata = self.Api1.getallVenues()
        self.assertGreater(len(allvenuesdata), 1)
        self.assertTrue(len(self.Api1.getallVenues()))
    
    def testpos_getVenue(self):
        self.assertTrue(len(self.Api1.getVenue("4965")))
        self.assertEqual(self.Api1.getVenue("4965")["id"], 4965)
        self.assertEqual(self.Api1.getVenue("4965")["name"], "AT&T Stadium")

    def testneg_getVenue(self):
        self.assertTrue(self.Api1.getVenue("abc")["status"], "error")

    def testpos_getallPerformers(self):
        allperformersdata = self.Api1.getallPerformers()
        self.assertGreater(len(allperformersdata), 1)
        self.assertTrue(len(self.Api1.getallPerformers()))

    def testpos_getPerformer(self):
        self.assertTrue(len(self.Api1.getPerformer("12007")))
        self.assertEqual(self.Api1.getPerformer("12007")["id"], 12007)
        self.assertEqual(self.Api1.getPerformer("12007")["name"], "College Football Playoff National Championship Game")

    def testneg_getPerformer(self):
        self.assertTrue(self.Api1.getPerformer("def")["status"], "error")

if __name__ == "__main__":
    unittest.main()