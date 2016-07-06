//
//  Constants.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit
import CoreLocation

//typealias CompletionBlock = (NSString?) -> Void
//typealias CompletionBlock = (result: NSData?, error: NSError?) -> Void


let kAtithi1PX = 1 / UIScreen.mainScreen().scale

// EPIC
let YES = true
let NO  = false

enum ConstantCornerRadius : CGFloat {
    case Big = 8.0, Mid = 4.0, Small = 2.0
}

let DateFormatter : NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    return dateFormatter
}()

let TokyoTowerLocation : Location = {
    let location = Location()
    location.title = "Tokyo Tower"
    location.detailDescription = "Build to stand out"
    return location
}()


let SecondsInADay : Double = 86400

typealias CompletionBlockItemsCount = (count: Int) -> Void
typealias CompletionBlockItems = (items: [AnyObject]?) -> Void
typealias CompletionBlockItem = (item: AnyObject?) -> Void
typealias CompletionBlockItemDictionary = (item: [String: AnyObject]?) -> Void
typealias CompletionBlockData = (data: NSData?) -> Void
typealias CompletionBlockDataModel = (items: [BaseObject]?) -> Void
typealias CompletionBlockSuccess = (success: Bool) -> Void

let GoogleMapAPIKEY = "AIzaSyDskmF9XuoEgif4OdVY2pujdxkvogO8HdE"


let kNotificationNameUserScheudle = "com.cksapp.notification.update.kNotificationNameUserScheudle"

let TokyoTowerCoordinate = CLLocationCoordinate2DMake(35.6585805,139.7454329)

let CurrentUser : User = {
    let user = User();
    return user;
}()

let CurrentUserSchduele : UserSchedule = {
    let item = UserSchedule();
    return item;
}()


func LS(k : String!) -> String {
    var s:String! = NSBundle.mainBundle().localizedStringForKey(k, value: "", table: nil)
    if nil == s {
        s = ""
    }
    return s
}

class Constants: NSObject {
    
}



