//
//  TableCell.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 07.12.2022.
//

import Foundation
import UIKit
 
class TableCell: UITableViewCell {

    static let reuseIdentifier = "TableCell"
    
    var presenter : HomePresenterProtocol?
    
    let mainTextLabel: UILabel = {
        let mainTextLabel = UILabel()
        mainTextLabel.textColor = .mainTextColor
        mainTextLabel.font = UIFont.boldSystemFont(ofSize: 15)
        return mainTextLabel
    }()
    
    let secondTextLabel: UILabel = {
        let detailTextLabel = UILabel()
        detailTextLabel.textColor = .secondaryTextColor
        detailTextLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        return detailTextLabel
    }()
    
    let priceTextLabel: UILabel = {
        let priceTextLabel = UILabel()
        priceTextLabel.textColor = .foodDGreen
        priceTextLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
        return priceTextLabel
    }()
    
    let addToChartButon: UIButton = {
        let buton = UIButton()
        buton.setTitle("Buy", for: .normal)
        buton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buton.layer.cornerRadius = 18
        buton.titleLabel?.textColor = .mainTextColor
        buton.backgroundColor = .foodDGreen
        return buton
    }()
    
    func configurate(_ model: ProductItemViewModel) {
        self.backgroundColor = .cellsGray
        self.imageView?.image = UIImage(named: model.image)
        self.imageView?.contentMode = .scaleAspectFit
        self.mainTextLabel.text = model.title
        self.secondTextLabel.text = model.details
        self.priceTextLabel.text = model.price
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
//        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 4
        
        stackView.addArrangedSubview(mainTextLabel)
        stackView.addArrangedSubview(secondTextLabel)
        stackView.addArrangedSubview(priceTextLabel)
        
        self.addSubview(stackView)
        self.addSubview(addToChartButon)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addToChartButon.translatesAutoresizingMaskIntoConstraints = false
        
        addToChartButon.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        addToChartButon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -150).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 12,y: 12 ,width: 64,height: 64)
        
        self.addToChartButon.bounds = CGRect(x: 0,y: 0 ,width: 80,height: 30)
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            let inset: CGFloat = 12.5
            var frame = newFrame
            frame.origin.x += inset
            frame.size.width -= 2 * inset
            super.frame = frame
        }
    }
}
