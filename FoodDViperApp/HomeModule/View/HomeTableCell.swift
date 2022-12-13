//
//  HomeTableCell.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 09.12.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HomeTableCell: TableCell {
    
    static let reuseStaticId = "HomeTableCell"
    
    let bag = DisposeBag()
//    @objc func buttonTapped(sender: UIButton) {

//
//    }
    
    func setup () {
        
//        addToChartButon
//            .rx
//            .tap
//            .bind{
//                let item: Item =
//                self.presenter?.onAddToCart(item: item)
//            }.disposed(by: bag)
        
//        addToChartButon.rx.modelSelected(CartItem.self)
//            .subscribe(onNext: { [unowned self] item in
//                self.presenter?.onAddToCart(item: item)
//            }).disposed(by: bag)
    }
    
    
    override func configurate(_ model: ProductItemViewModel) {
        super.configurate(model)
        setup ()
        
//        addToChartButon
//            .rx
//            .tap
//            .bind{
//                let item: Item = (id: model.title, quantity: 1)
//                self.presenter!.onAddToCart(item: item)
//            }.disposed(by: bag)
        
        
        addToChartButon.setTitle("buy", for: .normal)
    }
    
    
}
