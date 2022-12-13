//
//  HomePresenter.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 06.12.2022.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad ()
    func onAddToCart(item: Item)
}

class HomePresenter {
    
    weak var view: HomeViewControllerProtocol?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    init (view: HomeViewControllerProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func onAddToCart(item: Item) {
        
        DispatchQueue.global(qos: .background).async {
            let upd = self.interactor.addToCart(item: item)
            print ("cart updated with result : \(upd )")
        }
    }
    
    func viewDidLoad() {

        DispatchQueue.global(qos: .background).async {[weak self] in
            self?.interactor.getProducts(complition: { result in
                
                let productsList = result.products.compactMap( { ProductItemViewModel(model: $0) } )
                
                DispatchQueue.main.async {
                    self?.view?.updateProducts(productList: productsList)
                }
            })
        }
    }
}
//for what?
struct ProductItemViewModel {
    
    let title: String
    let details: String
    let image: String
    let price: String
    
    init (model : Product) {
        self.title = model.title
        self.details = model.details
        self.image = model.image
        self.price = "\(model.price) $"
    }
}
