//
//  HistoryModel.swift
//  CashRegister
//
//  Created by Tanishq Sharma on 27/02/22.
//

import UIKit

struct HistoryObject {
    var name: String
    var quantity: Int
    var totalPrice: Int
    var purchaseDate: String;
}

class HistoryModel {
    // stores the buying history
    var buyingHistory = [HistoryObject]();
    init(){
        
    }
    //adds it to the history
    public func add(name:String, quantity:Int, totalPrice:Int, purchaseDate: String){
        
        buyingHistory.append(HistoryObject(name: name, quantity: quantity, totalPrice: totalPrice, purchaseDate: purchaseDate))
    }
    
    // gets the buying history
    public func getHistory()->[HistoryObject]{
        return buyingHistory;
    }
}
