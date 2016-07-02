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
    
    return dateFormatter
}()


let SecondsInADay : Double = 86400

typealias CompletionBlockItemsCount = (count: Int) -> Void
typealias CompletionBlockItems = (items: [AnyObject]?) -> Void

let GoogleMapAPIKEY = "AIzaSyDskmF9XuoEgif4OdVY2pujdxkvogO8HdE"

let TokyoTowerCoordinate = CLLocationCoordinate2DMake(35.6585805,139.7454329)

func LS(k : String!) -> String {
    var s:String! = NSBundle.mainBundle().localizedStringForKey(k, value: "", table: nil)
    if nil == s {
        s = ""
    }
    return s
}

class Constants: NSObject {
    
}



