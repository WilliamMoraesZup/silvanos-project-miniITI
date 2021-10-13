//
//  ExcludeAccount.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 13/10/21.
//

import Foundation


struct ExcludeAccount {
    
    let view = UserMenuView()
    
    init(loggedUser : UserModel) {
         accountToExclude(loggedUser: loggedUser)
    }
    
    
    func accountToExclude(loggedUser : UserModel){
      if  loggedUser.account.balance != 0 {
        view.errorBalancesNeedsToBeZero()
      }
        
      else {
        DbQueries().deleteByDocument(user: loggedUser)
        view.sucessAccountExcluded()
        
        }
      
        
        
        
    }
    
}
