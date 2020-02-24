import json

class preprocess:
    def __init__(self, indata):
        self.Outdata = {}
        if indata:
            self.Indata = indata

    def Event_page_data(self):
        try:
            self.Outdata["id"] = self.Indata["id"]
            self.Outdata["title"] = self.Indata["title"]
            self.Outdata["venue_id"] = self.Indata["venue"]["id"]
            self.Outdata["description"] = self.Indata["description"]
            self.Outdata["image"] = self.Indata["performers"][0]["image"] or "/static/media/demoimg.3cffd639.jpg"
            self.Outdata["datetime_local"] = self.Indata["datetime_local"].replace('T','  ')
            self.Outdata["description"] = self.Indata["description"] or "None provided by Host"
            self.Outdata["full_address"] = self.Indata["venue"]["address"] + self.Indata["venue"]["extended_address"]

            if len(self.Indata["performers"]) == 1:
                for key,value in self.Indata["performers"][0].items():
                    if key in ["id","name"]:
                        if "performers_"+key+"s" in self.Outdata.keys():
                            self.Outdata["performers_"+key+"s"] = self.Outdata["performers_"+key+"s"] + ' , ' + str(value)
                        else:
                            self.Outdata["performers_"+key+"s"] = str(value)
            else:
                for i in self.Indata["performers"]:
                    for key,value in i.items():
                        if key in ["id","name"]:
                            if "performers_"+key+"s" in self.Outdata.keys():
                                self.Outdata["performers_"+key+"s"] = self.Outdata["performers_"+key+"s"] + ' , ' + str(value)
                            else:
                                self.Outdata["performers_"+key+"s"] = str(value)
            Outdata = json.loads(json.dumps(self.Outdata))
        except:
            Outdata = None
        finally:
            return Outdata