//
//  LoginController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation


class LoginController {
    
    func login() {
        
        let view = LoginView()
        guard let user = LoginView().inputDocumentNumber()     else {return
            view.errorInvalidLogin() }
        
        guard let password = LoginView().inputPassword()       else {return
            view.errorInvalidPass() }
        
        
    let loggedUser = DbQueries().findUserByDocumentAndPassword(userDocument: user, pass: password)
            
        
        if let validUser = loggedUser {
            NewUserView().showAccountStatus(acc: AccountExhibition(user: validUser))
            UserMenuController().startUserMenu(loggedUser: validUser)
            
        }
        else {
            LoginView().userNotFound()
            HomeViewController().startMainMenu() 
        }
        }
}
        
        
    
    
  

