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
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kNotificationNameUserScheudle, object: nil)
    }

    override init(title: String , collectionView: UICollectionView?) {
        super.init(title:title, collectionView : collectionView)
//        self.collectionViewEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0)
//        datesSelected.append(NSDate())
        
//        let today = NSDate()
//        for i in 1..<10 {
//            datesSelected.append(today.dateByAddingTimeInterval(SecondsInADay * Double(i)))
//        }
//        NSNotificationCenter.defaultCenter().postNotificationName(kNotificationNameUserScheudle, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MyScheduleSectionManager.updateSchduleView), name: kNotificationNameUserScheudle, object: nil)
    }
    
    internal func updateSchduleView() {
        self.collectionView?.reloadData()
    }
    

    override func numberOfSections() -> Int {
        self.sections.removeAll()
        GameService.sharedInstance.userScheduleDaily.keys.forEach { (date) in
            
            if let items = GameService.sharedInstance.userScheduleDaily[date.startOfDay()] where items.count > 0 {
                self.sections.append([DaySchdeduleManager(date:date, title: date.localizedStringMid(), collectionView:collectionView)])
            }
        }

        return self.sections.count
    }
    
    override func numberOfRowsInSection(section: Int) -> Int {
        return self.sections[section].count
    }
    
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
    
    override func collectionViewDidSelectItem(indexPath: NSIndexPath) {
        
    }

}
