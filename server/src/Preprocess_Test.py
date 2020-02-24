import unittest, requests
from Preprocess_data import preprocess

class preprocess_test(unittest.TestCase):
    def setUp(self):
        url = "https://api.seatgeek.com/2/events/4958533?client_id=MTkwMzc2MzB8MTU3MTc4MjA1Ni41Mw"
        self.prep1 = preprocess(requests.get(url).json())
        self.prep2 = preprocess({"id":123456})
        self.prep3 = preprocess([123456, 0000, 1111, 22222])
        self.prep4 = preprocess("123456, 0000, 1111, 22222")
    
    def tearDown(self):
        pass

    def test_class_instance(self):
        self.assertIsInstance(self.prep1, preprocess)
        self.assertIsInstance(self.prep2, preprocess)
        self.assertIsInstance(self.prep3, preprocess)
        self.assertIsInstance(self.prep4, preprocess)

    def test_data1(self):
        self.assertTrue(self.prep1.Event_page_data())

    def test_data2(self):
        self.assertFalse(self.prep2.Event_page_data())
    
    def test_data3(self):
        self.assertEqual(self.prep3.Event_page_data(), None)
    
    def test_data4(self):
        self.assertEqual(self.prep4.Event_page_data(), None)
        

if __name__ == "__main__":
    unittest.main()