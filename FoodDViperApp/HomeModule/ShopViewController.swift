//
//  ShopViewController.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 08.12.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ShopViewController: UIViewController {
    
    var mainVC: HomeViewController?
    
    var presenter : HomePresenterProtocol?
    
    var service: NetworkServiceAPI?
    
    var shopProducts: [ProductItemViewModel] = []
    
    let bag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds,
                                    style: .insetGrouped)
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.reuseIdentifier)
        return tableView
    }()
    
    convenience init(products: [ProductItemViewModel], mainVC : HomeViewController) {
        self.init(nibName:nil, bundle:nil)
        self.mainVC = mainVC
        self.title = products[0].details
        self.shopProducts = products
    }
    
    override func viewDidLoad() {
        self.presenter?.viewDidLoad()
        setupUI()
        setupRx()
    }
    
    func setupRx() {
        
    }
    
    func setupUI () {
        
        navigationController?.navigationBar.tintColor = .foodDGreen
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = .backgroundImage
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 640).isActive = true
    }
}


extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = shopProducts[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! HomeTableCell
        
        cell.configurate(model)
        
        cell.addToChartButon
            .rx
            .tap
            .bind{
                let item: Item = (id: model.title, quantity: 1)
                self.mainVC!.presenter!.onAddToCart(item: item)
            }.disposed(by: bag)

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        shopProducts.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        87
    }

}
