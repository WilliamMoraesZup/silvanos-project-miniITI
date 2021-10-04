//
//  AccountMenuController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 03/10/21.
//

import Foundation

struct LoggedUserMenuController {
    
    
    
    func startLoggedUserMenu(){
        
        
    }
    func caseSelection(option : Int, loggedUser: UserModel){
        
        switch option {
        case 1 : print("transferir ag conta")
        case 2 : transferAgencyAcc(loggedUser: loggedUser)
        default:
            print("invalido")
        }
        
    }
    
    
    func transferAgencyAcc(loggedUser : UserModel){
        
        
    }
    
    func paymentPix (loggedUser : UserModel){
        if (loggedUser.pix.count == 0){
            registerNewPixKey(loggedUser: loggedUser)
        }
    }

    func registerNewPixKey(loggedUser : UserModel){
       
    }
    
}
