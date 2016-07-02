//
//  DateHelper.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class DateHelper: NSDate {

}


extension NSDate {
    func localizedStringMid() -> String {
        return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
    func month() -> Int {
        return NSCalendar.currentCalendar().component(NSCalendarUnit.Month, fromDate: self)
    }
    
    func day() -> Int {
        return NSCalendar.currentCalendar().component(NSCalendarUnit.Day, fromDate: self)
    }
    
    func startOfDay() -> NSDate {
        return NSCalendar.currentCalendar().startOfDayForDate(self)
    }
    
}