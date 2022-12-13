//
//  HomeViewController.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 06.12.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol HomeViewControllerProtocol: AnyObject {
    func updateProducts(productList: [ProductItemViewModel]) -> ()
//    var presenter: HomePresenterProtocol {get set}
}

class HomeViewController : UIViewController {
    
    var presenter : HomePresenterProtocol?
    
    var service: NetworkServiceAPI?
    
    var products: [ProductItemViewModel] = []
    
    let bag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds,
                                    style: .insetGrouped)
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseIdentifier)
        return tableView
    }()
    
    let scrollView = UIScrollView()
    
    let headerView = UIImageView()
    
    let textLabelResto: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Nearest Restaurants:"
        textLabel.font = UIFont.boldSystemFont(ofSize: 16)
        textLabel.backgroundColor = .clear
        textLabel.textColor = .mainTextColor
        textLabel.textAlignment = .left
        return textLabel
    }()
    
    let textLabelMunu: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Popular Menu:"
        textLabel.font = UIFont.boldSystemFont(ofSize: 15)
        textLabel.backgroundColor = .clear
        textLabel.textColor = .mainTextColor
        textLabel.textAlignment = .left
        return textLabel
    }()
    
    let horizontalScrollView = HorizontalScrollView()
    
    override func viewDidLoad() {
        self.presenter?.viewDidLoad()
        
        self.horizontalScrollView.collectionView.delegate = self
        
        self.title = "Find Your Favorite Food"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = .backgroundImage
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.backgroundColor = .clear
        
        scrollView.addSubview(headerView)
        
        headerView.backgroundColor = .none
        
        headerView.image = UIImage(named: "Promo")
        headerView.contentMode = .scaleAspectFit
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        scrollView.addSubview(textLabelResto)
        
        textLabelResto.translatesAutoresizingMaskIntoConstraints = false
        textLabelResto.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        textLabelResto.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        textLabelResto.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 35).isActive = true
        textLabelResto.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        scrollView.addSubview(horizontalScrollView)
        //        verticalScrollView.backgroundColor = .black
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        //        verticalScrollView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        horizontalScrollView.topAnchor.constraint(equalTo: textLabelResto.bottomAnchor).isActive = true
        horizontalScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        //        verticalScrollView.heightAnchor.constraint(equalToConstant: 184).isActive = true
        horizontalScrollView.heightAnchor.constraint(equalToConstant: 184).isActive = true
        horizontalScrollView.isHidden = false
        
        scrollView.addSubview(textLabelMunu)
        
        textLabelMunu.translatesAutoresizingMaskIntoConstraints = false
        textLabelMunu.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        textLabelMunu.topAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor).isActive = true
        textLabelMunu.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 35).isActive = true
        textLabelMunu.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        scrollView.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: textLabelMunu.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 640).isActive = true
    }
    // Fit scrollView to size
    override func viewDidLayoutSubviews() {
        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }

    deinit {
        print("home vc is gone")
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {

    
    func updateProducts(productList: [ProductItemViewModel]) {
        self.products = productList
        
        self.horizontalScrollView.list = productList
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = products[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        
        cell.configurate(model)
        
        
        cell.addToChartButon
            .rx
            .tap
            .bind{
                let item: Item = (id: model.title, quantity: 1)
                self.presenter?.onAddToCart(item: item)
            }.disposed(by: bag)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        87
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resto = horizontalScrollView.listOfAvaliableResto[indexPath.row]
        let products = products.filter({$0.details == resto })
        let vc : ShopViewController = ShopViewController(products: products, mainVC: self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

