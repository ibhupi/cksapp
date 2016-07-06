//
//  ContainerCollectionViewCell.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class ContainerCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var collectionView: BaseCollectionView!
    
    @IBOutlet weak var titleLabel: UILabel!
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
    }
    
    override class func cellID() -> String {
        return "ContainerCollectionViewCell"
    }
    
    func configureFor(sectionManager: BaseSectionManager) -> Void {
        self.titleLabel.text = sectionManager.title
        self.collectionView.sectionManager = sectionManager
        self.collectionView.reloadData()
    }
    
    //    override func layoutSubviews() {
    //        super.layoutSubviews()
    //        self.collectionView.reloadData()
    //    }
    
}
