//
//  ColorConstants.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

enum ColorConstants {
    case Base, Black, LightGrayApha, White, Background, Green, Clear
    
    func color() -> UIColor {
        switch self {
        case .Base:
            return UIColor.redColor()
        case .Black:
            return UIColor.blackColor()
        case .White:
            return UIColor.whiteColor()
        case .Background:
            return UIColor.whiteColor()
        case .Green:
            return UIColor.greenColor()
        case .Clear:
            return UIColor.clearColor()
        case .LightGrayApha:
            return UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
        }
    }
}
