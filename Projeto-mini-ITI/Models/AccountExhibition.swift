//
//  AccountExibition.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 09/10/21.
//

import Foundation


struct AccountExhibition {
    
    let name : String
    let acc : Int
    let agency : Int
 private   let balance : Int
    
    init (user : UserModel) {
        
       
        
        name = user.name
        acc = user.account.accountNumber
        agency = user.account.agency
        balance = user.account.balance
    }
    
    func showBalance() -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        let priceString = currencyFormatter.string(from: NSNumber(value: balance))!
        
        return priceString
    }
}
