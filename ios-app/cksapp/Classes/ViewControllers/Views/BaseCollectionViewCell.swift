//
//  BaseCollectionViewCell.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    private var configuredOnce : Bool = NO
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if configuredOnce == NO {
            self.initCommon()
            self.configuredOnce = YES
        }
    }
    
    internal class func cellID() -> String {
        return "BaseCollectionViewCell"
    }
    
    internal func initCommon() {
        
    }
    
    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //        self.configuredOnce = YES
    //    }
}
