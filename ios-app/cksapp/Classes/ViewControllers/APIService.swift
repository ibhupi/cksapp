
//
//  APIService.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

private let EventListURLString = "http://114.55.119.118/api/events"

class APIService: NSObject {
    
    private class func dataFromURL(urlString: String, completionBlock: CompletionBlockData) {
        guard let url = NSURL(string: EventListURLString) else {
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
    
}
