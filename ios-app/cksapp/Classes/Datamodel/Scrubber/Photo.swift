//
//  Photo.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class Photo: BaseObject {
    var urlString = "http://www.babybedding.com/images/fabric/silver-gray-minky-fabric_medium.jpg";
    
    convenience init(id : String, urlString : String) {
        self.init()
        self.id = id
        self.urlString = urlString
    }
    
    class func dummyEventPhoto() -> Photo {
        return Photo(id: "1232132", urlString: "http://www.kato-inuneko.com/images/slider/cat02.jpg")
    }
    
    class func initPhoto(string: String) -> Photo? {
        return Photo(id: string, urlString: string)
    }
    
}