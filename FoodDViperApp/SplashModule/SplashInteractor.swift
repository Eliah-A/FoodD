//
//  SplashInteractor.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 04.12.2022.
//

import Foundation
import RxSwift

protocol SplashInteractorProtocol {
    func getRxUpdate()
}

final class SplashInteractor {
    weak var splashPresenter: SplashPresenterProtocol!
    private var bag = DisposeBag()
}

extension SplashInteractor: SplashInteractorProtocol {
    func getRxUpdate() {
        SplashLocal
            .getSplashEntitys()
            .subscribe(
                onNext: { entitys in
                    self.splashPresenter?.entitysFetched(entitys)
                }).disposed(by: bag)
    }
}
