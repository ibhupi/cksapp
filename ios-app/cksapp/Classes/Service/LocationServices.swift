//
//  LocationServices.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/3/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class LocationServices: BaseService {

    static let sharedInstance = LocationServices()
    
    var locations = [String: Location]()
    
    override init() {
        super.init()
        self.fetchAllLocations()
    }
    
    private func fetchAllLocations() -> Void {
        APIService.LocationsAll { (items) in
            guard let items = items else {
                return
            }
            items.forEach({ (object) in
                if let location = object as? Location {
                    self.locations[location.id] = location
                }
            })
        }
    }
    
}
