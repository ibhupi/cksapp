//
//  Event.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

enum EventType : String {
    case Olympic = "olympic", Local = "local", Popular = "popular", Restaurant = "restaurant"
}

class Event: BaseObject {
    var photos = [Photo]()
    var date = NSDate()
    var locationID : Int = 0
    var eventType = ""
    var eventTypeDetail = ""
    
    var userHasSelected : Bool = NO {
        didSet {
            if (userHasSelected == NO) {
                GameService.sharedInstance.removeFromMySchedule(self)
            } else {
                GameService.sharedInstance.addToMySchedule(self)
            }
        }
        
    }
    
    convenience init(id : String, title: String, detailDescription : String) {
        self.init()
        self.id = id
        self.title = title
        self.detailDescription = detailDescription
    }
    
    class func dummy(id : String, title: String, detailDescription : String) -> Event {
        let event = Event(id: id, title: title, detailDescription: detailDescription)
        
        event.photos.append(Photo.dummyEventPhoto())
        event.photos.append(Photo.dummyEventPhoto())
        event.photos.append(Photo.dummyEventPhoto())
        
        return event
    }
    
    func location() -> Location {
        return LocationServices.locationForID("\(self.locationID)")
    }
    
    override func scrubbedObject(object: AnyObject?) -> AnyObject? {
        if let data = object as? [String: AnyObject] {
            return EventScrubber.scrubObjectFromData(data)
        }
        return super.scrubbedObject(object)
    }
    
    override func scrubForKey(key: String, value: AnyObject) -> AnyObject? {
        if key == "photos" {
            if let rawPhotosString = value as? String {
                let rawItems = rawPhotosString.componentsSeparatedByString(",")
                var items = [Photo]()
                for item in rawItems {
                    if let photo = Photo.initPhoto(item) {
                        items.append(photo)
                    }
                }
                return items
            }
            return nil
        } else if (key == "id" ) {
            return super.scrubForKey(key, value: value)
        } else if (key == "startTime") {
            if let dateString = value as? String, let date = DateFormatter.dateFromString(dateString) {
                self.date = date
            }
            return nil
        }

        return value
    }

}
