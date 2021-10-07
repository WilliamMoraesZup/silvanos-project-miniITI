//
//  LoginController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation


class LoginController {
    
    func login() ->  UserModel? {
        guard let user = LoginView().inputDocumentNumber()     else {return  nil }
        guard let password = LoginView().inputPassword()       else {return  nil }
          print("buscando user no banco")
    let loggedUser = Database.instance.validateLogin(userDocument: user, pass: password)
            
        
        if let validUser = loggedUser {
            print("Usuario encontrado")
            return validUser
        }
        else {
            print("Usuario found")
            return nil
        }
        
        }
     
        }
        
        
        
    
    
  

