//
//  MainViewSectionManager.swift
//  cksapp
//
//  Created by Bhupendra Singh on 7/2/16.
//  Copyright © 2016 Bhupendra Singh. All rights reserved.
//

import UIKit

class MainViewSectionManager: BaseSectionManager {
    
    
    override init(title: String , collectionView: UICollectionView?) {
        super.init(title:title, collectionView : collectionView)
        self.collectionViewEdgeInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    override func loadSections(offset: Int, completionBlock: CompletionBlockItems) {
        var items = [AnyObject]()
        items.append(FeaturedGameSectionManager(title: LS("FeaturedGames"), collectionView:nil))
        items.append(AddNewGameSectionManager(title: LS("AddNewGames"), collectionView:collectionView))
        items.append(RestaurantSectionManager(title: ("PopularRestaurants"), collectionView:collectionView))
        items.append(PlaceSectionManager(title: ("PoplularPlaces"), collectionView:collectionView))
        items.append(LocalEventSectionManager(title: ("PopularEvents"), collectionView:collectionView))
        items.append(ShoppingPlaceSectionManager(title: ("PopularShoppingPlaces"), collectionView:collectionView))
        
        completionBlock(items: items)
    }
    
    
}
