//
//  VerticalScrollViewCell.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 08.12.2022.
//

import Foundation
import UIKit

final class VerticalScrollViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "VerticalScrollViewCell"
    
    var image = UIImage() {
        didSet {
            self.imageView.image = image
        }
    }
    
    var text = String() {
        didSet {
            self.titleTextLabel.text = text
            print (text)
        }
    }
    
     var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
     var titleTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.numberOfLines = 1
        textLabel.clipsToBounds = true
        textLabel.textColor = .mainTextColor
        textLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        layer.cornerRadius = 15.0
        layer.masksToBounds = false
        
        self.backgroundColor = .cellsGray
        
        self.addSubview(imageView)
        
        self.addSubview(titleTextLabel)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30).isActive = true
        
        titleTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40).isActive = true
        
//        let stack = UIStackView()
//
//        stack.axis  = NSLayoutConstraint.Axis.vertical
//        stack.distribution  = UIStackView.Distribution.equalSpacing
//        stack.alignment = UIStackView.Alignment.center
//        stack.spacing   = 10.0
//
//        stack.addArrangedSubview(imageView)
//        stack.addArrangedSubview(titleTextLabel)
//
//        stack.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
////            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            stack.topAnchor.constraint(equalTo: self.topAnchor)
//        ])
//
//        self.addSubview(stack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}


