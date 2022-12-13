//
//  ScrollView.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 08.12.2022.
//

import Foundation
import UIKit
import RxSwift

class HorizontalScrollView : UIView, UIScrollViewDelegate {
    
    
    var list: [ProductItemViewModel] = [] {
        didSet {
            self.listOfAvaliableResto = NSOrderedSet(array: list.map({$0.details}) ).map({ $0 as! String })
        }
    }
    
    var listOfAvaliableResto: [String] = [] {
        didSet {
            setupRxUpdate()
        }
    }
    
    let bag = DisposeBag()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.itemSize = .init(width: 147, height: 184)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(VerticalScrollViewCell.self, forCellWithReuseIdentifier: VerticalScrollViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top:5, left: 5, bottom: 5, right: 5)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentOffset = .zero
        collectionView.backgroundColor = .clear

        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubviews()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
    
    func setupRxUpdate() {
        
        let bindingData = Observable.just(listOfAvaliableResto)
        
        bindingData.asObservable()
            .bind(to: self.collectionView.rx.items(cellIdentifier: VerticalScrollViewCell.reuseIdentifier, cellType: VerticalScrollViewCell.self)) { row, data, cell in
                cell.image = UIImage(named:"\(data) Image")!
                cell.text = data
            }
            .disposed(by: bag)
        
        
//        collectionView.rx.setDelegate(self).disposed(by: bag)
        
    }
}

















//class  HorizontalScrollView : UIView, UIScrollViewDelegate {
//
//    var listOfAvaliableResto: [String] = [] {
//        didSet {
//
//            DispatchQueue.main.async {
//                self.restoCollectionView.reloadData()
//            }
//
//            let bindingData = Observable.just(listOfAvaliableResto)
//
//            let bag = DisposeBag()
//
//
//
//            bindingData.asObservable()
//                .bind(to: self.restoCollectionView.rx.items(cellIdentifier: VerticalScrollViewCell.reuseIdentifier, cellType: VerticalScrollViewCell.self)) { row, data, cell in
//
//                    cell.image = UIImage(named:"\(data) Image")!
//                    cell.text = data
//                    print("\(data) Image")
//
//                }
//                .disposed(by: bag)
//
//
//            restoCollectionView.rx.setDelegate(self).disposed(by: bag)
//
//        }
//    }
//
//     var restoCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 0
//        layout.itemSize = .init(width: 147, height: 184)
//         let cv = UICollectionView(frame: .infinite, collectionViewLayout: layout)
////        cv.contentInsetAdjustmentBehavior = .never
////        cv.showsHorizontalScrollIndicator = false
////        cv.contentOffset = .zero
////        cv.register(VerticalScrollViewCell.self, forCellWithReuseIdentifier: VerticalScrollViewCell.reuseIdentifier)
////        cv.backgroundColor = .white
//        return cv
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        restoCollectionView.delegate = self
////        restoCollectionView.dataSource = self
//
//
//        backgroundColor = .gray
//        addSubview(restoCollectionView)
//
//
//
//        restoCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        restoCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        restoCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        restoCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
////        restoCollectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        restoCollectionView.heightAnchor.constraint(equalToConstant: 184).isActive = true
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

//extension VerticalScrollView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = restoCollectionView.dequeueReusableCell(withReuseIdentifier: VerticalScrollViewCell.reuseIdentifier, for: indexPath) as! VerticalScrollViewCell
////        cell.imageView.image =  UIImage(named:"\(listOfAvaliableResto[indexPath.row]) Image")
////        cell.titleTextLabel.text = listOfAvaliableResto[indexPath.row]
////        return cell
////    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: frame.width, height: frame.width)
////    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("count\(listOfAvaliableResto.count)")
//        return 4
//    }
//
//}
