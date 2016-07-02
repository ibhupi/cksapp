//
//  MyScheduleViewController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class MyScheduleViewController: BaseCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = LS("MySchedule")
        self.title = title
        // Do any additional setup after loading the view.
        if let collectionView = self.collectionView {
            self.setSectionManager(MyScheduleSectionManager(title: title, collectionView: collectionView))
        }
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(MyScheduleViewController.addNewEvent))
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addNewEvent() {
        let selectEventViewController = BaseCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        selectEventViewController.model = YES
        let navigationController = UINavigationController.init(rootViewController: selectEventViewController)
        self.presentViewController(navigationController, animated: YES, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
