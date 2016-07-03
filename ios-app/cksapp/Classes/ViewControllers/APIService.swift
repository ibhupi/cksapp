
//
//  APIService.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

private let EventListURLString = "http://114.55.119.118/api/events"
private let LocationsListURLString = "http://114.55.119.118/api/locations"

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
    
    
    
    
}
