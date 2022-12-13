//
//  NavigationBuilder.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 07.12.2022.
//

import Foundation
import UIKit

class NavigationBuilder {
    static func buildNavigation(rootVC: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.title = "Welcome"
////        navVC.navigationBar.isTranslucent = true
////        navVC.isNavigationBarHidden = true
//        navVC.navigationBar.prefersLargeTitles = true
//
//        navVC.navigationBar.tintColor = .mainTextColor
//
//        let navigationBarAppearance = UINavigationBarAppearance()
//
//        navigationBarAppearance.configureWithTransparentBackground()
////        navigationBarAppearance.backgroundColor = .clear
//        navigationBarAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
//                                                      .foregroundColor: UIColor.white]
        
        
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                                                                            .foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 31),
                                                                                            .foregroundColor: UIColor.white]

        navigationBarAppearance.configureWithTransparentBackground()

        
        navVC.navigationBar.standardAppearance = navigationBarAppearance
        navVC.navigationBar.compactAppearance = navigationBarAppearance
        navVC.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        return navVC
    }
}
