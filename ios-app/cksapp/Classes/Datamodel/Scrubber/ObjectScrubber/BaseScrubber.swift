//
//  BaseScrubber.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class BaseScrubber: NSObject {
    
    class internal func minimusKeys() -> [String]? {
        return nil
    }
    
    class internal func mappedKeys() -> [String: String]? {
        return nil
    }
    
    class internal func inValid(data: [String: AnyObject]) -> Bool {
        if let keys = self.minimusKeys() {
            for key in keys {
                if (data[key] == nil) {
                    return true
                }
            }
        }
        return false
    }
    
    class func scrubObjectFromData(var data:[String: AnyObject]) -> [String: AnyObject]? {
        
        // Check neccessary keys from server are present
        if self.inValid(data) {
            return nil
        }
        
        // Map server keys to objects local keys
        if let mappedKeys = self.mappedKeys() {
            for key in mappedKeys.keys {
                if let mappedKey = mappedKeys[key], value = data.removeValueForKey(key) {
                    data[mappedKey] = value
                }
            }
        }
        
        return data
    }
    
    class func scrubObjectArrayFromData(data:[[String: AnyObject]]) -> [AnyObject]? {
        var scrubbedData = [AnyObject]()
        for item in data {
            if let scrubbedItem = self.scrubObjectFromData(item) {
                scrubbedData.append(scrubbedItem)
            }
        }
        return scrubbedData
    }
}
