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
        GameService.sharedInstance.featuredGames { (items) in
            completionBlock(items: [items ?? [AnyObject]()])
        }
    }
    
    override func collectionView(sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        guard let collectionView = self.collectionView else {
            return CGSizeZero
        }
        
        let height = CGRectGetHeight(collectionView.frame)
        
        return CGSizeMake(height, height)
    }
    

}
