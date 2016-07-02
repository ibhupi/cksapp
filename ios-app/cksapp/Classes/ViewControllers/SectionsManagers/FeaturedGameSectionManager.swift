//
//  FeaturedGameSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class FeaturedGameSectionManager: BaseSectionManager {
    
    override init(title: String , collectionView: UICollectionView?) {
        super.init(title:title, collectionView : collectionView)
        self.scrollingDirection = .Horizontal
        self.minimumInteItemSpacing = 0
        self.minimumSectionItemSpacing = 0
        self.collectionViewEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.pagingEnabled = YES
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
        
        return CGSizeMake(CGRectGetWidth(collectionView.frame), CGRectGetHeight(collectionView.frame))
    }
    
}
