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
//        datesSelected.append(NSDate())
        
//        let today = NSDate()
//        for i in 1..<10 {
//            datesSelected.append(today.dateByAddingTimeInterval(SecondsInADay * Double(i)))
//        }
    }
    
//    override func numberOfSections() -> Int {
//        let count = self.sections.count
//        if (self.sections.count == 0) {
//            self.loadSections(0, completionBlock: { (items) in
//                self.sections.removeAll()
//                if let items = items  {
//                    for i in 0..<items.count {
//                        // if itemsArray as not casted as array then array of items is added a single objects of array
//                        if let itemsArray = items[i] as? [AnyObject] {
//                            self.sections.append(itemsArray)
//                        } else {
//                            self.sections.append([items[i]])
//                        }
//                    }
//                }
//                if count != self.sections.count {
//                    self.collectionView?.reloadData()
//                }
//            })
//        }
//        return self.sections.count
//    }
//    
//    override func numberOfRowsInSection(section: Int) -> Int {
//        let count = self.sections.count
//        if self.sections[section].count == 0 {
//            self.loadDataForSection(section, completionBlock: { (items) in
//                self.sections[section].removeAll()
//                items?.forEach({ (item) in
//                    self.sections[section].append(item)
//                })
//                if count != self.sections[section].count {
//                    self.collectionView?.reloadSections(NSIndexSet(index: section))
//                }
//            })
//        }
//        
//        return self.sections[section].count
//    }
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        var items = [AnyObject]()
        
//        self.datesSelected.forEach { (date) in
//            items.append(DaySchdeduleManager(date:date, title: date.localizedStringMid(), collectionView:collectionView))
//        }
        
        GameService.sharedInstance.userScheduleDaily.keys.forEach { (date) in
            items.append(DaySchdeduleManager(date:date, title: date.localizedStringMid(), collectionView:collectionView))
        }
        
        completionBlock(items: items)
    }
    

}
