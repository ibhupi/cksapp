//
//  Event.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class Event: BaseObject {
    var id = ""
    var title = ""
    var photos = [Photo]()
    var detailDescription = ""
    
    
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
        }
        if (key == "id") {
            return super.scrubForKey(key, value: value)
        }
        return value
    }

}
