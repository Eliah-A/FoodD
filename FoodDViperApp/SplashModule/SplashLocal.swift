//
//  SplashLocal.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 05.12.2022.
//

import Foundation
import RxSwift

final class SplashLocal {
    static func getSplashEntitys() -> Observable<[SplashEntity]> {
        let splashEntitys = Observable.just([
        SplashEntity(title: "Find Your Favorite FoodD here",
                     subtitle: "Here You Can find a chef or dish for every taste and color. Enjoy!",
                     imageName: "SplashIMG1"),
        SplashEntity(title: "FoodD is Where Your Food Lives",
                     subtitle: "Enjoy a fastest and smoothest foodD delivery at your doorstep",
                     imageName: "SplashIMG2")
        ])
        return splashEntitys
    }
}
