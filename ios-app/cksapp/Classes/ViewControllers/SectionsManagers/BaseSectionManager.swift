//
//  BaseSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

protocol BaseSectionManagerProtocol {
    func reloadSecion(index: Int) -> Void
}

class BaseSectionManager: NSObject {
    
    var sections = [[AnyObject]]()
    var title : String
    var collectionView : UICollectionView? = nil {
        didSet {
            self.initCommon()
        }
    }
    
    var scrollingDirection = UICollectionViewScrollDirection.Vertical
    var minimumInteItemSpacing : CGFloat = 0
    var minimumSectionItemSpacing : CGFloat = 0
    var collectionViewEdgeInset = UIEdgeInsetsZero
    var pagingEnabled = NO
    var roundedCornerCell = YES
    
    var baseCollectionContainers = [MainViewSectionManager.self, MyScheduleSectionManager.self]
    
    init(title : String, collectionView: UICollectionView?) {
        self.collectionView = collectionView
        self.title = title
        super.init()
    }
    
    internal func initCommon() -> Void {
        self.collectionView?.pagingEnabled = self.pagingEnabled
    }
    
    func numberOfSections() -> Int {
        let count = self.sections.count
        if (self.sections.count == 0) {
            self.loadSections(0, completionBlock: { (items) in
                self.sections.removeAll()
                if let items = items  {
                    for i in 0..<items.count {
                        // if itemsArray as not casted as array then array of items is added a single objects of array
                        if let itemsArray = items[i] as? [AnyObject] {
                            self.sections.append(itemsArray)
                        } else {
                            self.sections.append([items[i]])
                        }
                    }
                }
                if count != self.sections.count {
                    self.collectionView?.reloadData()
                }
            })
        }
        return self.sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        let count = self.sections.count
        if self.sections[section].count == 0 {
            self.loadDataForSection(section, completionBlock: { (items) in
                self.sections[section].removeAll()
                items?.forEach({ (item) in
                    self.sections[section].append(item)
                })
                if count != self.sections[section].count {
                    self.collectionView?.reloadSections(NSIndexSet(index: section))
                }
            })
        }
        
        return self.sections[section].count
    }
    
    func loadSections(offset: Int, completionBlock: CompletionBlockItems) -> Void {
//        completionBlock(items: nil)
    }
    
    func loadDataForSection(index: Int, completionBlock: CompletionBlockItems) -> Void {
//        completionBlock(items: nil)
    }
    
    func cellForRowAtIndexPath(indexPath : NSIndexPath) -> UICollectionViewCell {
        let rows = self.sections[indexPath.section]
        
        if let sectionManager = rows[indexPath.row] as? BaseSectionManager {
            if let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier(ContainerCollectionViewCell.cellID(), forIndexPath: indexPath) as? ContainerCollectionViewCell {
                cell.configureFor(sectionManager)
                return cell
            }
        }
        
        if let event = rows[indexPath.row] as? Event {
            if let cell =  self.collectionView?.dequeueReusableCellWithReuseIdentifier(ImageTitleCollectionViewCell.cellID(), forIndexPath: indexPath) as? ImageTitleCollectionViewCell {
                cell.configureFor(event,corner: self.roundedCornerCell)
                return cell
            }
        }
        if let collectionView = self.collectionView {
            return collectionView.dequeueReusableCellWithReuseIdentifier(BaseCollectionViewCell.cellID(), forIndexPath: indexPath)
        }
        return BaseCollectionViewCell()
    }
    
    func collectionView(sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        guard let collectionView = self.collectionView else {
            return CGSizeZero
        }
        
        if (self.baseCollectionContainers.containsObject(self.dynamicType)) {
            return CGSizeMake(CGRectGetWidth(collectionView.frame), min(CGRectGetHeight(collectionView.frame) - 10, 200))
        }
        return CGSizeMake(CGRectGetWidth(collectionView.frame), CGRectGetHeight(collectionView.frame))
    }
    
    func collectionView(insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return collectionViewEdgeInset
    }
    
    func collectionView(minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.minimumSectionItemSpacing
    }
    
    func collectionView(minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.minimumInteItemSpacing
    }
    
    
    
    func collectionViewDidSelectItem(indexPath: NSIndexPath) -> Void {
        let item = self.sections[indexPath.section][indexPath.row]
        if let event = item as? Event {
            if (event.userHasSelected) {
                AddRemoveEventAlertController.confirmRemoveEvent(event, completionBlock: { (success) in
                    self.collectionView?.reloadItemsAtIndexPaths([indexPath])
                })
            } else {
                GameService.sharedInstance.addToMySchedule(event)
                collectionView?.reloadItemsAtIndexPaths([indexPath])
            }
        }
    }

    
}