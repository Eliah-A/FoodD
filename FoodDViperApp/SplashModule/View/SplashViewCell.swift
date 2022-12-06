//
//  SplashViewCell.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 05.12.2022.
//

import UIKit

final class SplashViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SplashViewCell"
    
    var cellData : SplashEntity? {
        didSet {
            guard cellData?.imageName != nil, cellData?.subtitle != nil, cellData?.title != nil else {return}
            imageView.image = UIImage(named: cellData!.imageName)
            titleTextLabel.text = cellData!.title
            descriptionTextLabel.text = cellData!.subtitle
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.numberOfLines = 2
        textLabel.clipsToBounds = true
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 25)
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    private let descriptionTextLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.clipsToBounds = true
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 15)
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 10.0
        
        stackView.addArrangedSubview(titleTextLabel)
        stackView.addArrangedSubview(descriptionTextLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 75)
        ])
    }
}
    
    
