//
//  AddRemoveEventAlertController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/3/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class AddRemoveEventAlertController: NSObject {

    
    class func confirmRemoveEvent(event: Event, completionBlock: CompletionBlockSuccess?) -> Void {
        let title = event.userHasSelected ?  "Remove Event" : "Add event"
        var message = "Add event " + event.title + ", " + event.detailDescription
        if event.userHasSelected {
            message = "Remove event " + event.title + ", " + event.detailDescription
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action) in
            if event.userHasSelected {
                GameService.sharedInstance.removeFromMySchedule(event)
            } else {
                GameService.sharedInstance.addToMySchedule(event)
            }
            if let completionBlock = completionBlock {
                completionBlock(success: YES)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) in
            
        }))
        if let rootViewController = self.getVisibleViewController(nil) {
            rootViewController.presentViewController(alertController, animated: YES, completion: nil)
        }
    }
    
    class func getVisibleViewController(var rootViewController: UIViewController?) -> UIViewController? {
        
        if rootViewController == nil {
            rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
        }
        
        if rootViewController?.presentedViewController == nil {
            return rootViewController
        }
        
        if let presented = rootViewController?.presentedViewController {
            if presented.isKindOfClass(UINavigationController) {
                let navigationController = presented as! UINavigationController
                return navigationController.viewControllers.last!
            }
            
            if presented.isKindOfClass(UITabBarController) {
                let tabBarController = presented as! UITabBarController
                return tabBarController.selectedViewController!
            }
            
            return getVisibleViewController(presented)
        }
        return nil
    }
}
