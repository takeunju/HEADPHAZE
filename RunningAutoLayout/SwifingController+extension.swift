//
//  SwifingController+extension.swift
//  RunningAutoLayout
//
//  Created by 탁은주 on 2018. 4. 19..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit

extension SwipingController{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0{
                self.collectionView?.contentOffset = .zero
            }else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
            
        }
    }
    
    
}
