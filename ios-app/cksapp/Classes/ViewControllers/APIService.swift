
//
//  APIService.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

private let UserURLString = "http://114.55.119.118/api/users/new"
private let EventListURLString = "http://114.55.119.118/api/events"
private let LocationsListURLString = "http://114.55.119.118/api/locations"
private let UserScheduleURLString = "http://114.55.119.118/api/user_schedules"

class APIService: NSObject {
    
    private class func dataFromURL(urlString: String, completionBlock: CompletionBlockData) {
        guard let url = NSURL(string: urlString) else {
            completionBlock(data: nil)
            return
        }
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            dispatch_async(dispatch_get_main_queue(), {
                completionBlock(data: data)
            })
        }
        task.resume()
    }
    
    private class func jsonFromURL(urlString: String, completionBlockItem: CompletionBlockItem) {
        self.dataFromURL(urlString) { (data) in
            guard let data = data else {
                completionBlockItem(item: nil)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                completionBlockItem(item: json)
            } catch {
                completionBlockItem(item: nil)
            }
        }
    }
    
    private class func jsonArrayFromURL(urlString: String, completionBlockItems: CompletionBlockItems) {
        self.jsonFromURL(urlString) { (item) in
            if let items = item as? [AnyObject] {
                completionBlockItems(items: items)
            } else {
                completionBlockItems(items: nil)
            }
        }
    }
    
    private class func jsonDictionaryFromURL(urlString: String, completionBlockItems: CompletionBlockItemDictionary) {
        self.jsonFromURL(urlString) { (item) in
            if let items = item as? [String: AnyObject] {
                completionBlockItems(item: items)
            } else {
                completionBlockItems(item: nil)
            }
        }
    }
    
    class func UserFromAPI(completionBlock: CompletionBlockDataModel) {
        self.jsonFromURL(UserURLString) { (item) in
            let user = User()
            if let dict = item as? [String : AnyObject] {
                if let userID = dict["id"] as? Int {
                    user.id = "\(userID)"
                }
            }
            completionBlock(items: [user])
        }
    }
    
    class func UserScheduleFromAPI(completionBlock: CompletionBlockDataModel) {
        self.jsonArrayFromURL(UserScheduleURLString) { (items) in
            var schedules = [UserSchedule]()
            items?.forEach({ (item) in
                if let schedule = UserSchedule.initWithDictionary(item) {
                    schedules.append(schedule)
                }
            })
            completionBlock(items: schedules)
        }
    }

    
    
    private static var allGames = [Event]()
    class func GamesAll(completionBlock: CompletionBlockDataModel) {
        if (allGames.count > 0) {
            completionBlock(items: allGames);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    events.append(event)
                }
            })
            allGames = events
            completionBlock(items: events)
        }
    }
    
    private static var featuredGames = [Event]()
    class func FeaturedGames(completionBlock: CompletionBlockDataModel) {
        if (featuredGames.count > 0) {
            completionBlock(items: featuredGames);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    if event.ranking <= 10 {
                        events.append(event)
                    }
                }
            })
            featuredGames = events
            completionBlock(items: events)
        }
    }

    
    private static var allLocations = [Location]()
    class func LocationsAll(completionBlock: CompletionBlockDataModel) {
        if (allLocations.count > 0) {
            completionBlock(items: allLocations);
            return
        }
        self.jsonArrayFromURL(LocationsListURLString) { (items) in
            var locations = [Location]()
            items?.forEach({ (item) in
                if let location = Location.initWithDictionary(item) {
                    locations.append(location)
                }
            })
            allLocations = locations
            completionBlock(items: locations)
        }
    }
    
    private static var popularRestaurantsAll = [Event]()
    class func PopularRastaurantsAll(completionBlock: CompletionBlockDataModel) {
        if (popularRestaurantsAll.count > 0) {
            completionBlock(items: popularRestaurantsAll);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    if event.eventType == EventType.Restaurant.rawValue {
                        events.append(event)
                    }
                }
            })
            popularRestaurantsAll = events
            completionBlock(items: events)
        }
    }
    
    private static var popularPlacesAll = [Event]()
    class func PopularPlacesAll(completionBlock: CompletionBlockDataModel) {
        if (popularPlacesAll.count > 0) {
            completionBlock(items: popularPlacesAll);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    if event.eventType == EventType.Popular.rawValue {
                        events.append(event)
                    }
                }
            })
            popularPlacesAll = events
            completionBlock(items: events)
        }
    }
    
    private static var popularLocalEventsAll = [Event]()
    class func PopularLocalEventsAll(completionBlock: CompletionBlockDataModel) {
        if (popularLocalEventsAll.count > 0) {
            completionBlock(items: popularLocalEventsAll);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    if event.eventType == EventType.Local.rawValue {
                        events.append(event)
                    }
                }
            })
            popularLocalEventsAll = events
            completionBlock(items: events)
        }
    }
    
    private static var popularShoppingPlacesAll = [Event]()
    class func PopularShoppingPlacesAll(completionBlock: CompletionBlockDataModel) {
        if (popularShoppingPlacesAll.count > 0) {
            completionBlock(items: popularShoppingPlacesAll);
            return
        }
        self.jsonArrayFromURL(EventListURLString) { (items) in
            var events = [Event]()
            items?.forEach({ (item) in
                if let event = Event.initWithDictionary(item) {
                    if event.eventType == EventType.Shopping.rawValue {
                        events.append(event)
                    }
                }
            })
            popularShoppingPlacesAll = events
            completionBlock(items: events)
        }
    }
    
    
    class func SaveCurrentSchedule(completion:CompletionBlockSuccess) {
        guard let userID = Int(CurrentUserSchduele.userID) else {
            return
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://114.55.119.118/api/user_schedules")!)
        request.HTTPMethod = "POST"
        
        var postString = "userID=\(userID)&detail=\(CurrentUserSchduele.detail)"
        
        if let scheduleID = Int(CurrentUserSchduele.id) {
            postString += "&id=\(scheduleID)"
        }
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                completion(success: NO)
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                completion(success: NO)
                return
            }
            
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("responseString = \(responseString)")
            completion(success: YES)
        }
        task.resume()
    }
    
    
    
    
}
