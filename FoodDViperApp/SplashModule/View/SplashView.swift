//
//  SplashView.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 05.12.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class SplashView: UIView {
    
    var presenter : SplashPresenterProtocol!
    
    // MARK: - Content propertys
    
    private let bag = DisposeBag()
    
    var viewData: [SplashEntity] = [] {
        didSet {
            setupRxUpdate()
        }
    }
    
    // MARK: - UI propertys
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(SplashViewCell.self, forCellWithReuseIdentifier: SplashViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top:0, left: 0, bottom: 0, right: 0)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentOffset = .zero
        
        collectionView.backgroundColor = .foodDBlack
        return collectionView
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        let title = "Next"
        nextButton.setTitle(title, for: .normal)
        nextButton.titleLabel?.textColor = .white
        nextButton.backgroundColor = .foodDGreen
        nextButton.titleLabel?.textAlignment = .center
        //        nextButton.frame = CGRect(x: 0, y: 0, width: 157, height: 57)
        nextButton.layer.cornerRadius = 15
        return nextButton
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.numberOfPages = viewData.count
        pageControl.backgroundColor = .foodDBlack
        return pageControl
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .foodDBlack
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUps
    
    
    
    
    func setupRxUpdate() {
        
        let bindingData = Observable.just(viewData)
        
        bindingData.asObservable()
            .bind(to: self.collectionView.rx.items(cellIdentifier: SplashViewCell.reuseIdentifier, cellType: SplashViewCell.self)) { row, cellData, cell in
                
                cell.cellData = cellData
            }
            .disposed(by: bag)
        
        
        collectionView.rx.setDelegate(self).disposed(by: bag)
        
        bindingData.asObservable()
            .map { $0.count }
            .bind(to: pageControl.rx.numberOfPages)
            .disposed(by: bag)
    }
    
    
    func setUpSubviews() {
        
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(nextButton)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: -30),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            
            pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.midX+79),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,  constant: self.bounds.midX-79),
            nextButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 57.0),
            nextButton.widthAnchor.constraint(equalToConstant: 157.0)
        ])
    }
}

// MARK: - Extensions

extension SplashView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.width)
    }
}

extension SplashView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
    }
}
