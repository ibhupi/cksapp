
//
//  SelectUnselectImageView.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class SelectUnselectImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tintColor = ColorConstants.Green.color()
    }
    
    var selected = NO {
        didSet {
            self.image = UIImage(named: "Check")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            self.hidden = self.selected == NO
        }
    }

}
