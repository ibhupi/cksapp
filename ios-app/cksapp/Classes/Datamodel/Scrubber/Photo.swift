//
//  Photo.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class Photo: BaseObject {
    var id = ""
    var smallURL  = ""
    var mediumURL = ""
    var largeURL = ""
    
    convenience init(id : String, smallURL : String, mediumURL : String, largeURL : String) {
        self.init()
        self.id = id
        self.smallURL = smallURL
        self.mediumURL = mediumURL
        self.largeURL = largeURL
    }
    
    class func dummyEventPhoto() -> Photo {
        return Photo(id: "1232132", smallURL: "http://www.kato-inuneko.com/images/slider/cat02.jpg", mediumURL: "http://www.kato-inuneko.com/images/slider/cat02.jpg", largeURL: "http://www.kato-inuneko.com/images/slider/cat02.jpg")
    }
    
}