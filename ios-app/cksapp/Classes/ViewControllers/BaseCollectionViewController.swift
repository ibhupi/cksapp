//
//  BaseCollectionViewController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseCollectionViewController: UICollectionViewController {
    
    internal var model = NO
    
    var reloadSectionsOnViewWillAppear = YES
    
    public class func ViewContorller() -> BaseCollectionViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewControllerWithIdentifier("BaseCollectionViewController") as? BaseCollectionViewController {
            return viewController
        }
        return BaseCollectionViewController(nibName: nil, bundle: nil)
    }
    
    var sectionManagerCurrent = BaseSectionManager(title: "", collectionView: nil)
    
    func setSectionManager(sectionManager: BaseSectionManager) -> Void {
        if let collectionView = self.collectionView as? BaseCollectionView {
            collectionView.delegate = collectionView
            collectionView.dataSource = collectionView
            collectionView.sectionManager = sectionManager
        }
        self.title = sectionManager.title
        self.sectionManagerCurrent = sectionManager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.collectionView?.backgroundColor = ColorConstants.Background.color()
        
        if (self.model) {
            self.applyCloseButtonLeft()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if (reloadSectionsOnViewWillAppear) {
            self.sectionManagerCurrent.sections.removeAll()
            self.collectionView?.reloadData()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
