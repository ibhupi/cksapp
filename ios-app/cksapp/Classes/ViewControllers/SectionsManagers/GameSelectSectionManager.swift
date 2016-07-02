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
        GameService.sharedInstance.AllGames { (items) in
            completionBlock(items: [items ?? [Event]()])
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
