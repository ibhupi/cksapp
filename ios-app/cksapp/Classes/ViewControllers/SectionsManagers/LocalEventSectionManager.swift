//
//  LocalEventSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class LocalEventSectionManager: BaseSectionManager {
    
    override init(title: String , collectionView: UICollectionView?) {
        super.init(title:title, collectionView : collectionView)
        self.scrollingDirection = .Horizontal
        self.minimumInteItemSpacing = 0
        self.minimumSectionItemSpacing = 20
        self.collectionViewEdgeInset = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        GameService.sharedInstance.AllPopularLocalEvents { (items) in
            completionBlock(items: [items ?? [AnyObject]()])
        }
    }
    
    override func collectionView(sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        guard let collectionView = self.collectionView else {
            return CGSizeZero
        }
        
        let height = CGRectGetHeight(collectionView.frame)
        let width = CGRectGetWidth(collectionView.frame) * 3/4
        
        return CGSizeMake(width, height)
    }
    
}
