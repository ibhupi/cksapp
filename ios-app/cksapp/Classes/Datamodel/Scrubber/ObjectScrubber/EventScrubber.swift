
//
//  EventScrubber.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class EventScrubber: BaseScrubber {
    
    class override internal func minimusKeys() -> [String]? {
        return ["id", "title", "description", "photo"]
    }

    class override func mappedKeys() -> [String : String]? {
        return
            ["description":"detailDescription", "photo" : "photos", "photos" : "photos", "location" : "locationID"]
    }
}
