//
//  Deposit.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation
struct Deposit {
    
    
    
func deposit(loggedUser : UserModel) {
    let view = UserMenuView()
    
    if let deposit = view.inputDepositValue(), deposit > 0 {
        loggedUser.creditValue(value: deposit)
        view.showDepositSucess()
        
        UserMenuView().showBalance(value: loggedUser.returnFormatedBalance() )
        
    }
    else { print("valor invalido")  }
}
}
