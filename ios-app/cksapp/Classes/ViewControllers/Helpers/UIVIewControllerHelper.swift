//
//  UIVIewControllerHelperViewController.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func applyCloseButtonLeft() -> Void {
        guard let _ = self.navigationController else {
            return
        }
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: #selector(UIViewController.dismissViewController))
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func dismissViewController() -> Void {
        self.dismissViewControllerAnimated(YES, completion: nil)
    }
    
}
