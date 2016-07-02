//
//  DaySchdeduleManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class DaySchdeduleManager: BaseSectionManager {
    let date : NSDate
    
    init(date: NSDate, title: String , collectionView: UICollectionView?) {
        self.date = date
        super.init(title:title, collectionView : collectionView)
        self.collectionViewEdgeInset = UIEdgeInsetsMake(20, 0, 0, 0)
        self.scrollingDirection = .Horizontal
        self.minimumInteItemSpacing = 0
        self.minimumSectionItemSpacing = 20
        self.collectionViewEdgeInset = UIEdgeInsetsMake(0, 20, 0, 0)
    }
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        
        if let events = GameService.sharedInstance.userScheduleDaily[self.date.startOfDay()] {
            completionBlock(items: [events])
        } else {
            completionBlock(items: nil)
        }
        
//        GameService.sharedInstance.userScheduleDaily[self.date.startOfDay()].forEach { (date) in
//            items.append(DaySchdeduleManager(date:date, title: date.localizedStringMid(), collectionView:collectionView))
//        }

    }
    
    override func collectionView(sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        guard let collectionView = self.collectionView else {
            return CGSizeZero
        }
        
        let height = CGRectGetHeight(collectionView.frame)
        
        return CGSizeMake(height, height)
    }
    

}
