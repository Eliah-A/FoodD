//
//  InsteadOfNetworkService.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 06.12.2022.
//

import Foundation

typealias ProductClosure = (ProductResult) -> (Void)
protocol NetworkServiceAPI {
    func fetchProducts(complition: ProductClosure) -> Void
}

class NetworkService {
    static let shared: NetworkService = NetworkService()
    private init() {}
}

extension NetworkService: NetworkServiceAPI {
    func fetchProducts(complition: ProductClosure) {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result = try JSONDecoder().decode(ProductResult.self, from: data)
                complition(result)
            } catch {
                print (error)
            }
        }
    }
}
