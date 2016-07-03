//
//  UserSchedule.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class UserSchedule: BaseObject {
    var userID = ""
    var like = 0
    var canShare : Bool = NO
    var detail  = ""
    var date = NSDate()
    
    override func scrubForKey(key: String, value: AnyObject) -> AnyObject? {
        if (key == "id" ) {
            return super.scrubForKey(key, value: value)
        } else if (key == "userID" && value.isKindOfClass(NSNumber.self) == YES) {
            return "\(value)"
        } else if (key == "canShare") {
            if let intValue = value as? Int {
                return intValue > 0
            }
            return NO
        } else if (key == "date") {
            if let dateString = value as? String, let date = DateFormatter.dateFromString(dateString) {
                self.date = date
            }
            return nil
        }
        
        return value
    }
}
