//
//  Balance.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation

struct Balance {
    
    func balance(loggedUser : UserModel){
            UserMenuView().showBalance(value: loggedUser.returnFormatedBalance() )
        
    }
}
