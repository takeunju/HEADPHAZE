//
//  PageCell.swift
//  RunningAutoLayout
//
//  Created by 탁은주 on 2018. 4. 17..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
   
   
    var page: Page? {
        didSet{
             guard let unwrappedPage = page else { return }
            headphazeImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25),NSAttributedStringKey.foregroundColor: UIColor.red])
            
            attributedText.append(NSAttributedString(string: unwrappedPage.bodyText, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18),NSAttributedStringKey.foregroundColor: UIColor.darkGray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
   private let headphazeImageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "headphazeRound"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
   private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "ENJOY\nHEADPHAZE\nMUSIC", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25),NSAttributedStringKey.foregroundColor: UIColor.red])
        
        attributedText.append(NSAttributedString(string: "\n\n\nILYMK", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18),NSAttributedStringKey.foregroundColor: UIColor.darkGray]))
        
        textView.attributedText = attributedText
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.addSubview(headphazeImageView)
        headphazeImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        headphazeImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        headphazeImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraintEqualToSystemSpacingBelow(bottomAnchor, multiplier: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
