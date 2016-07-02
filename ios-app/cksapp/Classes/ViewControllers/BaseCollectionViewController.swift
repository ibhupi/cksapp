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
    
//    public class func ViewContorller() -> BaseCollectionViewController {
//        if let storyBoard =
//    }
    
    func setSectionManager(sectionManager: BaseSectionManager) -> Void {
        if let collectionView = self.collectionView as? BaseCollectionView {
            collectionView.delegate = collectionView
            collectionView.dataSource = collectionView
            collectionView.sectionManager = sectionManager
        }
        self.title = sectionManager.title
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
