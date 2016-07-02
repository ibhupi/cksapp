//
//  MyScheduleSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class MyScheduleSectionManager: BaseSectionManager {
    
    var datesSelected = [NSDate]()

    override init(title: String , collectionView: UICollectionView?) {
        super.init(title:title, collectionView : collectionView)
//        self.collectionViewEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0)
        datesSelected.append(NSDate())
        
        let today = NSDate()
        for i in 1..<10 {
            datesSelected.append(today.dateByAddingTimeInterval(SecondsInADay * Double(i)))
        }
    }
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        var items = [AnyObject]()
        
        self.datesSelected.forEach { (date) in
            items.append(DaySchdeduleManager(date:date, title: date.localizedStringMid(), collectionView:collectionView))
        }
        completionBlock(items: items)
    }
    

}
