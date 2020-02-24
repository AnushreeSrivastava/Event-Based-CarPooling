import unittest, requests
from API_Interfaces import API_get_Interface

class API_get_Interface_Test(unittest.TestCase):
    def setUp(self):
        self.TestAPI = API_get_Interface()

    def tearDown(self):
        pass

    def test_API(self):
        self.assertIsInstance(self.TestAPI, API_get_Interface)

if __name__ == "__main__":
    unittest.main()