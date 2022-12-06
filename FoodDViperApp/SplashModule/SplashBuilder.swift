//
//  SplashBuilder.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 04.12.2022.
//

import Foundation
import UIKit

 class SplashBuilder {
     static func build() -> UIViewController {
        let viewController = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter(viewController: viewController)
        let presenter = SplashPresenter(view: viewController, interactor: interactor, router: router)
        viewController.presenter = presenter
        interactor.splashPresenter = presenter
        return viewController
    }
}
