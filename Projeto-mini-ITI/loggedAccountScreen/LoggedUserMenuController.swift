//
//  AccountMenuController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 03/10/21.
//

import Foundation

struct LoggedUserMenuController {
    
    
    
    func startLoggedUserMenu(loggedUser : UserModel){
        
        let loggedUserView = LoggedUserMenuView()
        
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
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
        case 3:  // Cadatrar nova Chave Pix
           NewPixKey().registerNewPixKey(loggedUser: loggedUser)
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
        case 4: // Depositar
            Deposit().deposit(loggedUser: loggedUser)
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
            
        case 5: // Saldo
            Balance().balance(loggedUser: loggedUser)
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
            
        case 6: // Excluir Conta
            print("Excluir conta")
        // TODO: conta deve estar zerada
        
        
        case 7: // Sair
            HomeViewController().startMainMenu()
            
            
        default:
            print("invalido")
            
        }
        print("Deveria cair aqui? vai chamar o startloggedUsermen ")
        self.startLoggedUserMenu(loggedUser: loggedUser)
    }
     
    
}

