//
//  UIColorExtension.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 05.12.2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static var foodDBlack: UIColor {
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    static var foodDGreen: UIColor {
        #colorLiteral(red: 0, green: 0.8106037974, blue: 0.4586759806, alpha: 1)
    }
    
    static var mainTextColor: UIColor {
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    static var secondaryTextColor: UIColor {
        #colorLiteral(red: 0.3999999464, green: 0.3999999464, blue: 0.3999999464, alpha: 1)
    }
    
    static var cellsGray: UIColor {
        #colorLiteral(red: 0.1450980604, green: 0.1450980604, blue: 0.1450980604, alpha: 1)
    }
    
    static var backgroundImage = UIColor(patternImage: UIImage(named: "BackIMG1.png")!)
}
