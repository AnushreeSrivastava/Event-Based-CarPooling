from abc import ABC,abstractmethod #this is imported to declare class as Abstract class and methods as abstract methods

#This file consists of Interface class
class API_get_Interface(ABC):
    def getallEvents(self): pass
    def getEvent(self, eventId): pass
    def getallVenues(self): pass
    def getVenue(self, venueId): pass
    def getallPerformers(self): pass
    def getPerformer(self, performerId): pass