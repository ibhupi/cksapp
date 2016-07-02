//
//  BaseObjectHelper.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

import ObjectiveC


private var kRawDictionaryAssociationKey: UInt8 = 0

extension NSObject {
    
    var rawDictionary: [String:AnyObject]? {
        get {
            return objc_getAssociatedObject(self, &kRawDictionaryAssociationKey) as? [String:AnyObject]
        }
        
        set (newValue) {
            objc_setAssociatedObject(self, &kRawDictionaryAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    class func initWithDictionary(dictionary: AnyObject?) -> Self? {
        
        guard let dictionary = dictionary as? [String: AnyObject] else {
            return nil
        }
        
        let object = self.init()
        
        guard let dictionaryScrubbed = object.scrubbedObject(dictionary) as? [String: AnyObject] else {
            return nil
        }
        
        object.copyKeyValueFromDictionary(dictionaryScrubbed)
        
        if(object.isValid() == NO) {
            return nil
        }
        
        return object
    }
    
    class func initWithArray(dictionaryArray: [[String:AnyObject]]) -> [AnyObject] {
        var objectsArray = [AnyObject]()
        dictionaryArray.forEach { (dictionary) -> () in
            if let object = self.initWithDictionary(dictionary) as? AnyObject {
                objectsArray.append(object)
            }
        }
        return objectsArray
    }
    
    class func initWithActualDictionary(dictionary: [String: AnyObject]?) -> Self {
        return self.init()
    }
    
    func scrubbedObject(object: AnyObject?) -> AnyObject? {
        return object
    }
    
    private func copyKeyValueFromDictionary(dictionary: [String: AnyObject]) {
        //    http://stackoverflow.com/questions/16861204/property-type-or-class-using-reflection
        //    http://stackoverflow.com/questions/769319/how-to-detect-a-property-return-type-in-objective-c
        dictionary.forEach { (key:String, value:AnyObject) -> () in
            if (self.isNotNSNull(value)) {
                if let value = self.scrubForKey(key, value: value) {
                    if (self.isNotNSNull(value)) {
                        self.setValue(value, forKey: key)
                    }
                }
            }
        }
        self.setValue(dictionary, forKey: "rawDictionary")
    }
    
    
    func isNotNSNull(object:AnyObject) -> Bool {
        return object.classForCoder != NSNull.classForCoder()
    }
    
    func scrubForKey(key: String, value:AnyObject) -> AnyObject? {
        if (key == "id" && value.isKindOfClass(NSNumber.self) == YES) {
            return "\(value)"
        }
        return value
    }
    
    func isValid() -> Bool {
        return true
    }
    
}