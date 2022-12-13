//
//  HomeInteractor.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 06.12.2022.
//

import Foundation

typealias Item = (id: String, quantity: Int)

protocol HomeInteractorProtocol {
    func getProducts(complition: ProductClosure)
    func addToCart(item:Item) ->Bool
}

class HomeInteractor {
    var service: NetworkServiceAPI
    var dataBase : cartDB
    init (service: NetworkServiceAPI, database: cartDB){
        self.service = service
        self.dataBase = database
    }
}
 
extension HomeInteractor: HomeInteractorProtocol {
    
    func addToCart(item:Item) -> Bool {
        self.dataBase.updateCart(using: CartItem(id: item.id, value: item.quantity))
    }
    
    func getProducts(complition: (ProductResult) -> (Void)) {
        print("Products")
        self.service.fetchProducts { result in
            print("getProducts")
            complition(result)
        }
    }
}
