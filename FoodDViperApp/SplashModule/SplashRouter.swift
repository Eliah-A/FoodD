//
//  SplashRouter.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 04.12.2022.
//

import Foundation
import UIKit

protocol SplashRouterProtocol {
}


class SplashRouter {
    var VC :UIViewController
    init(viewController: UIViewController){
        self.VC = viewController
    }
}

extension SplashRouter: SplashRouterProtocol {
}
