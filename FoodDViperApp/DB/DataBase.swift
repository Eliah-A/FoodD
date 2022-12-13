//
//  DataBase.swift
//  FoodDViperApp
//
//  Created by Илья Сергеевич on 09.12.2022.
//

import Foundation
import RealmSwift


protocol cartDB {
    func updateCart(using item: CartItem) -> Bool
}

class DataBase {
    static let shared: DataBase = DataBase()
    private init() {}
}

extension DataBase: cartDB {
    
    func updateCart(using item: CartItem) -> Bool {
        
        let realm = try! Realm()
        
        do{
            try realm.write {
                realm.add(RealmCartItem(cartItem: item), update: .all)
            }
        } catch {
            print ("error: \(error)")
            return false
        }
        
    return true
        
    }

}
