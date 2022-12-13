//
//  HomeBuilder.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 06.12.2022.
//

import Foundation
import UIKit

protocol HomeBuilderProtocol {}

class HomeBuilder {
    static func build(using: (UIViewController) -> (UINavigationController)) -> UIViewController {
       let viewController = HomeViewController()
        let interactor = HomeInteractor(service: NetworkService.shared, database: DataBase.shared)
       let router = HomeRouter(viewController: viewController)
       let presenter = HomePresenter(view: viewController, interactor: interactor, router: router)
       viewController.presenter = presenter
//       interactor.splashPresenter = presenter
       return using(viewController)
   }
}
