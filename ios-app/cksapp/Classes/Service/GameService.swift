//
//  GameService.swift
//  cksapp/Users/Macaria/Ebios/iOS/cksapp/ios-app/cksapp/Classes/Datamodel/Scrubber/Event.swift
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit


class GameService: BaseService {
    
    static let sharedInstance = GameService()
    
    var userEvents = [String: Event]()
    var userSchedule = [[[Event]]]()
    var userScheduleDaily = [NSDate:[Event]]()
    
    override init() {
        super.init()
        
        for _ in 0..<12 {
            var events = [[Event]]()
            for _ in 0..<31 {
                events.append([Event]())
            }
            userSchedule.append(events)
        }
    }
    
    func featuredGames(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.FeaturedGames(completionBlock)

    }
    
    func AllGames(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.GamesAll(completionBlock)
    }
    
    func AllPopularPlaces(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.PopularPlacesAll(completionBlock)
    }
    
    func AllPopularRestaurants(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.PopularRastaurantsAll(completionBlock)
    }
    
    func AllPopularLocalEvents(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.PopularLocalEventsAll(completionBlock)
    }
    
    func AllPopularShoppingPlaces(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.PopularShoppingPlacesAll(completionBlock)
    }

    
    func addToMySchedule(event : Event) {
        self.userEvents[event.id] = event
        if var events = self.userScheduleDaily[event.date.startOfDay()] {
            events.append(event)
            self.userScheduleDaily[event.date.startOfDay()] = events
        } else {
            var events = [Event]()
            events.append(event)
            self.userScheduleDaily[event.date.startOfDay()] = events
        }
        self.updateSchedule()
    }
    
    func  removeFromMySchedule(event : Event) {
        self.userEvents.removeValueForKey(event.id)
        let eventDay = event.date.startOfDay()
        if var events = self.userScheduleDaily[eventDay] {
            if (events.count == 1) {
                self.userScheduleDaily[eventDay]?.removeAll()
            } else if let index = events.indexOf(event) {
                events.removeAtIndex(index)
                self.userScheduleDaily[event.date.startOfDay()] = events
            }
        }
        self.updateSchedule()
    }
    
    private func updateSchedule() {
        var detail = [String]()
        let allEvents = self.userEvents.values
        allEvents.forEach { (event) in
            detail.append(event.id)
        }
        let detailString = detail.joinWithSeparator(",")
        CurrentUserSchduele.detail = detailString
        APIService.SaveCurrentSchedule { (success) in
            self.fetchCurrentUserSchedule()
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName(kNotificationNameUserScheudle, object: nil)
    }
    
    func fetchCurrentUserSchedule() {
        APIService.UserScheduleFromAPI { (items) in
            items?.forEach({ (item) in
                if let schedule = item as? UserSchedule {
                    if schedule.userID == CurrentUser.id {
                        CurrentUserSchduele.id = schedule.id
                        CurrentUserSchduele.detail = schedule.detail
                        CurrentUserSchduele.canShare = schedule.canShare
                    }
                }
            })
        }
    }

    
    private func dummyGameEvents() -> [Event] {
        var items = [Event]()
        
        items.append(Event.dummy("fdsfdasfafd", title: "Tenis", detailDescription: "Tenis is fun game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Chess", detailDescription: "Chess is challenging game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Swimming", detailDescription: "Swimming is fun"))
        items.append(Event.dummy("fdsfdasfafd", title: "Running", detailDescription: "Running is difficult"))
        items.append(Event.dummy("fdsfdasfafd", title: "Tenis", detailDescription: "Tenis is fun game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Chess", detailDescription: "Chess is challenging game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Swimming", detailDescription: "Swimming is fun"))
        items.append(Event.dummy("fdsfdasfafd", title: "Running", detailDescription: "Running is difficult"))
        items.append(Event.dummy("fdsfdasfafd", title: "Tenis", detailDescription: "Tenis is fun game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Chess", detailDescription: "Chess is challenging game"))
        items.append(Event.dummy("fdsfdasfafd", title: "Swimming", detailDescription: "Swimming is fun"))
        items.append(Event.dummy("fdsfdasfafd", title: "Running", detailDescription: "Running is difficult"))
        return items
    }
    
    func userEventsSortedDate() -> [Event] {
        var eventsSorted = [Event]()
//        self.userEvents.values.forEach { (event) in
//            eventsSorted.append(event)
//        }
        
        eventsSorted = self.userEvents.values.sort { (eventOne, eventTwo) -> Bool in
            return eventOne.date.compare(eventTwo.date) == NSComparisonResult.OrderedAscending
        }
        
        return eventsSorted
    }
    
}
