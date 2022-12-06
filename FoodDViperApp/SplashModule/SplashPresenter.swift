//
//  SplashPresenter.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 04.12.2022.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func entitysFetched(_ entitys : [SplashEntity])
    func viewDidLoad()
}

final class SplashPresenter {
    weak var view: SplashViewControllerProtocol?
    var interactor: SplashInteractorProtocol
    var router: SplashRouterProtocol
    
    
    var splashEntitys: [SplashEntity] = [] {
        didSet {
            view?.showSplashData(splashEntitys)
        }
    }
    
    init (view: SplashViewControllerProtocol, interactor: SplashInteractorProtocol, router: SplashRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension SplashPresenter: SplashPresenterProtocol {
    
    func viewDidLoad() {
        interactor.getRxUpdate()
    }
    
    func entitysFetched(_ entitys: [SplashEntity]) {
        self.splashEntitys = entitys
    }
}

