//
//  AccountMenuController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 03/10/21.
//

import Foundation

struct UserMenuController {
    
    
    
    func startUserMenu(loggedUser : UserModel){
        
        let loggedUserView = UserMenuView()
        
        let selected = loggedUserView.showOptions()
        
        guard let validSelection = selected else { return }
        
        caseSelection(option: validSelection, loggedUser: loggedUser)
        
    }
    
    
    
    func caseSelection(option : Int, loggedUser: UserModel){
     
        switch option {
        case 1: //Transferir Agencia / Conta
            TransferAgAcc().transfer(loggedUser: loggedUser)
            
            
        case 2: //Pagar ou Transferir com Pix
            PaymentByPix().paymentPix(loggedUser: loggedUser)
            self.startUserMenu(loggedUser: loggedUser)
            
        case 3:  // Cadatrar nova Chave Pix
           NewPixKey().registerNewPixKey(loggedUser: loggedUser)
            self.startUserMenu(loggedUser: loggedUser)
            
        case 4: // Depositar
            Deposit().deposit(loggedUser: loggedUser)
            self.startUserMenu(loggedUser: loggedUser)
            
            
        case 5: // Saldo
            Balance().balance(loggedUser: loggedUser)
            self.startUserMenu(loggedUser: loggedUser)
            
            
        case 6: // Excluir Conta
            print("Excluir conta")
        // TODO: conta deve estar zerada
        
        
        case 7: // Sair
            HomeViewController().startMainMenu()
            
            
        default:
            print("invalido")
            
        } 
        self.startUserMenu(loggedUser: loggedUser)
    }
     
    
}

