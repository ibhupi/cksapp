//
//  Location.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit
import CoreLocation

class Location: BaseObject {
    var lattitude : Double = 35.6585805
    var longitude : Double = 139.7454329
    var coordinate = TokyoTowerCoordinate
    
    override func scrubbedObject(object: AnyObject?) -> AnyObject? {
        if let data = object as? [String: AnyObject] {
            return LocationScrubber.scrubObjectFromData(data)
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
        } else if (key == "id") {
            return super.scrubForKey(key, value: value)
        } else if (key == "lattitude" || key == "longitude") {
            if let valueString = value as? String, valueDouble = Double(valueString) {
                if key == "lattitude" {
                    self.lattitude = valueDouble
                } else if key == "longitude" {
                    self.longitude = valueDouble
                }
                self.coordinate = CLLocationCoordinate2DMake(self.lattitude, self.longitude)
            }
            
            return nil
        }
        return value
    }

    
}
