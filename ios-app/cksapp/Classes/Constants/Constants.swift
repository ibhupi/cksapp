//
//  Constants.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

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

typealias CompletionBlockItemsCount = (count: Int) -> Void
typealias CompletionBlockItems = (items: [AnyObject]?) -> Void

func LS(k : String!) -> String {
    var s:String! = NSBundle.mainBundle().localizedStringForKey(k, value: "", table: nil)
    if nil == s {
        s = ""
    }
    return s
}

class Constants: NSObject {
    
}



