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
    
    func featuredGames(completionBlock:CompletionBlockDataModel) -> Void {
        completionBlock(items: dummyGameEvents())
    }
    
    func AllGames(completionBlock:CompletionBlockDataModel) -> Void {
        APIService.GamesAll(completionBlock)
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
