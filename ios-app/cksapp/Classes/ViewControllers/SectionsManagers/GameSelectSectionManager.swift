//
//  GameSelectSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class GameSelectSectionManager: BaseSectionManager {
    var sectionsTitle = [String]()
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        var gamesInMonths = [[Event]]()
        
        GameService.sharedInstance.featuredGames { (items) in
            for i in 0..<100  {
                let date = NSDate().dateByAddingTimeInterval(SecondsInADay * Double(i))
                var events = [Event]()
                items?.forEach({ (item) in
                    if let item = item as? Event {
                        events.append(item)
                    }
                })
                gamesInMonths.append(events)
                self.sectionsTitle.append(date.localizedStringMid())
            }
            completionBlock(items: gamesInMonths)
        }
    }
    
    override func collectionView(sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        guard let collectionView = self.collectionView else {
            return CGSizeZero
        }
        
        let width = CGRectGetWidth(collectionView.frame) / 3
        
        return CGSizeMake(width, width)
    }

}
