//
//  SplashScreenViewController.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 04.12.2022.
//

import UIKit
import RxSwift

protocol SplashViewControllerProtocol: AnyObject {
    func showSplashData(_ splashEntitys: [SplashEntity])
}

final class SplashViewController: UIViewController {
    
    var presenter : SplashPresenterProtocol!
    
    lazy var splashVeiw: SplashView = {
        let view = SplashView()
//        view.presenter = self.presenter
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .foodDBlack
        self.presenter.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        view.addSubview(splashVeiw)
        splashVeiw.frame = self.view.bounds
        
        splashVeiw.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashVeiw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            splashVeiw.topAnchor.constraint(equalTo: self.view.topAnchor),
            splashVeiw.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            splashVeiw.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension SplashViewController: SplashViewControllerProtocol {
    
    func showSplashData(_ splashEntitys: [SplashEntity]) {
        splashVeiw.viewData = splashEntitys
    }
}
