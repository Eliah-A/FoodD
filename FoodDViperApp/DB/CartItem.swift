//
//  CartItem.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 09.12.2022.
//

import Foundation
import RealmSwift



class RealmCartItem: Object {
    
    @objc dynamic var id : String = ""
    @objc dynamic var value : Int = 0
    @objc dynamic var date : Date = Date()
    
    override class func primaryKey() -> String? {
        return "id"
    }

}


struct CartItem {
    let id: String
    let value: Int
    
    init(id: String, value: Int) {
        self.id = id
        self.value = value
    }
}

extension CartItem {
    
    init(realmItem: RealmCartItem) {
        self.id = realmItem.id
        self.value = realmItem.value
    }
}

extension RealmCartItem {
    convenience init(cartItem: CartItem) {
        self.init()
        self.id = cartItem.id
        self.value = cartItem.value
    }
}
