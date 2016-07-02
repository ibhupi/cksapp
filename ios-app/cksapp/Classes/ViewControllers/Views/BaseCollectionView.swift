//
//  BaseCollectionView.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate {
    
    var sectionManager = BaseSectionManager(title: "", collectionView: UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())) {
        didSet {
            if let layout: UICollectionViewFlowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = sectionManager.scrollingDirection
            }
            sectionManager.collectionView = self
            //            sectionManager.initCommon()
            self.reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        layout
        self.backgroundColor = ColorConstants.Clear.color()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.registerClass(BaseCollectionViewCell.self, forCellWithReuseIdentifier: BaseCollectionViewCell.cellID())
        self.registerNib(UINib.init(nibName: ContainerCollectionViewCell.cellID(), bundle: nil), forCellWithReuseIdentifier: ContainerCollectionViewCell.cellID())
        self.registerNib(UINib.init(nibName: ImageTitleCollectionViewCell.cellID(), bundle: nil), forCellWithReuseIdentifier: ImageTitleCollectionViewCell.cellID())
        self.backgroundColor = ColorConstants.Clear.color()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sectionManager.numberOfSections()
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.sectionManager.numberOfRowsInSection(section)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return self.sectionManager.cellForRowAtIndexPath(indexPath)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.sectionManager.collectionViewDidSelectItem(indexPath)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return self.sectionManager.collectionView(sizeForItemAtIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return self.sectionManager.collectionView(insetForSectionAtIndex: section)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.sectionManager.collectionView(minimumLineSpacingForSectionAtIndex: section)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return self.sectionManager.collectionView(minimumInteritemSpacingForSectionAtIndex: section)
    }
    
    //
    //    optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //
    //    }
    //
    //    optional public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    //
    //    }
    
}
