//
//  GameService.swift
//  cksapp
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
        completionBlock(items: dummyGameEvents())
    }
    
    func AllGames(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.GamesAll(completionBlock)
    }
    
    func addToMySchedule(event : Event) {
        self.userEvents[event.id] = event
        if var events = self.userScheduleDaily[event.date.startOfDay()] {
            events.append(event)
        } else {
            var events = [Event]()
            events.append(event)
            self.userScheduleDaily[event.date.startOfDay()] = events
        }
    }
    
    func  removeFromMySchedule(event : Event) {
        self.userEvents.removeValueForKey(event.id)
        let eventDay = event.date.startOfDay()
        self.userScheduleDaily.removeValueForKey(eventDay)
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
    
}
