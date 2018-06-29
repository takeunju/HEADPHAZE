//
//  SwipingController.swift
//  RunningAutoLayout
//
//  Created by 탁은주 on 2018. 4. 17..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit

struct Page {
    let imageName: String
    let headerText: String
    let bodyText: String
}

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "headphazeRound", headerText: "HEADPHAZE\nMUSIC", bodyText: ""),
        Page(imageName: "rockTheHouse", headerText: "ROCKTHEHOUSE", bodyText: "\n\nOriginal"),
        Page(imageName: "lradPropaganda copy", headerText: "LRAD PROPAGANDA", bodyText: "\n\nHEADPHAZE MASHUP"),
        Page(imageName: "theScoutsCode", headerText: "The Scount's Code", bodyText: "\n\nOriginal Mix"),
        Page(imageName: "gnash - i hate u i love u (ft. ollivia o'brien)", headerText: "gnashi (ft. ollivia o'brien)\nhate u i love u", bodyText: "\n\nHEADPHAZE REMIX"),
        Page(imageName: "We Don't Talk Anymore (feat. Selena Gomez)", headerText: "Charlie Puth (ft. Selena Gomez)\nWe Don't Talk Anymore", bodyText: "\n\nHEADPHAZE REMIX"),
        Page(imageName: "Stayin' Alive (HEADPHAZE Edit)", headerText: "Beegees\nStayin' Alive", bodyText: "\n\nHEADPHAZE Edit"),
        Page(imageName: "Since U Been Gone (HEADPHAZE Remix)", headerText: "Kelly Clarkson\nSince U Been Gone", bodyText: "\n\nHEADPHAZE REMIX"),
        Page(imageName: "Say My Name feat. Zyra (HEADPHAZE Remix)", headerText: "ODESZA (ft. Zyra)\nSay My Name", bodyText: "\n\nHEADPHAZE REMIX")]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
   lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = UIColor(red: 255/255, green: 100/255, blue: 100/255, alpha: 0.2)
        return pc
    }()
    
    fileprivate func setupButtonControls(){
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControls()
        collectionView?.backgroundColor = .black
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
        
    }
}
