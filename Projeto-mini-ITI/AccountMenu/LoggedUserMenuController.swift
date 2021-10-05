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
        let loggedView = LoggedUserMenuView()
        
        switch option {
        case 1: //Transferir Agencia / Conta
            transferAgencyAcc(loggedUser: loggedUser)
            
            
        case 2: //Pagar ou Transferir com Pix
            
            // pede pra cadastrar uma chave pix antes de prosseguir
            if loggedUser.pix.count == 0 {
                loggedView.warningAbsencePix()
                
                let pixResult = registerNewPixKey(loggedUser: loggedUser)
                
                if(pixResult.result){
                    paymentPix(loggedUser: loggedUser)
                }
                else {
                    print("ERRO")
                }
            }
            LoggedUserMenuController().startLoggedUserMenu(loggedUser: loggedUser)
            
        case 3:  // Cadatrar nova Chave Pix
            let pixResult = registerNewPixKey(loggedUser: loggedUser)
            
            if  pixResult.pixValue != nil {
                loggedView.showPixRegisterSucess()
            }
            
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
        case 4: // Depositar
            deposit(loggedUser: loggedUser)
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
        case 5: // Saldo
            balance(loggedUser: loggedUser)
            self.startLoggedUserMenu(loggedUser: loggedUser)
            
        case 6: // Excluir Conta
            print("Excluir conta")
        // TODO: conta deve estar zerada
        
        case 7: // Sair
            HomeViewController().startMainMenu()
            
        default:
            print("invalido")
            
        }
        print("   self.startLoggedUserMenu(loggedUser: loggedUser)  ")
        self.startLoggedUserMenu(loggedUser: loggedUser)
    }
    
    func transferAgencyAcc(loggedUser : UserModel){
        
        let view = LoggedUserMenuView()
        
        guard let toAgency = view.inputAgToTransfer() else {
            return print("agencia invalida")
        }
        if (!Database.instance.agencyExists(value: toAgency)) {
        print("Conta não encontrada")
        }
        
        guard let toAccount = view.inputAccToTransfer() else {
            return print("agencia invalida")
        }
        
        if (!Database.instance.accountExists(value: toAccount)){
        print("Conta não encontrada")
        }
        
        guard let ammount = view.inputAmmountToTransfer() else {
            return print("valor invalido")
        }
        
        if Database.instance.validateTransfer(agency: toAgency, acc: toAccount, ammount: ammount, loggedUser : loggedUser){
            
            print("a transferencia ira ocorrer com sucesso")
            view.showBalance(value: String( loggedUser.account.balance))
        }
        else {
        print("erro ao transferr")
        }
        
      
        
        
        
    }
    
    
    func paymentPix (loggedUser : UserModel) -> Bool {
        
        return false
    }
    
    
    func deposit(loggedUser : UserModel) {
        let view = LoggedUserMenuView()
        
        if let deposit = view.inputDepositValue(), deposit > 0 {
            loggedUser.creditValue(value: deposit)
            view.showDepositSucess()
            
            let balance = String(loggedUser.account.balance)
            
            LoggedUserMenuView().showBalance(value: balance )
            
        }
        else { print("valor invalido")  }
    }
    
    func balance(loggedUser : UserModel){
        let balance = String(loggedUser.account.balance)
        LoggedUserMenuView().showBalance(value: balance )
        
    }
    
    
    func registerNewPixKey(loggedUser : UserModel) -> (result: Bool, pixValue: String?) {
        let loggedUserView = LoggedUserMenuView()
        
        guard let unwrapPixOption = loggedUserView.inputPixType() else {
            return (false, nil)
        }
        
        guard let unwrapPixType = PixType(rawValue: unwrapPixOption) else {
            return  (false, nil) }
        
        // OPÇAO ESCOLHIDA - RANDOM KEY
        
        if unwrapPixType == .RANDOM_KEY {
            let randomValue =   UUID().uuidString
            loggedUser.addNewPixKey(
                pixKey: Pix.init(
                    value: randomValue,
                    type: unwrapPixType))
            
            //finalizo a funçao
            return (true, randomValue)
            
        }
        
        
        else {
            // Visto que a opçao escolhida nao foi RANDOM
            // agora peço o valor da chave
            // se a chave for valida sera salva na classe
            guard let unwrapPixValue = loggedUserView.inputPixValue() else   {
                print("tipo invalido")
                return (false , nil)
            }
            
            //chama a funcao para conferir se a chave já existe
            if (Database.instance.pixKeyAlreadyExists(value: unwrapPixValue)){
                print("Essa chave já se encontra cadastrad")
                
                // FIXME: essa parte esta ambigua
                // arrumar com o loop
                return (true , nil)
            }
            //Valida a chave atraves do ENUM
            // Finaliza salvando o Pix no usuario
            if  unwrapPixType.validate(value: unwrapPixValue) {
                loggedUser.addNewPixKey(pixKey: Pix.init(
                                            value: unwrapPixValue,
                                            type: unwrapPixType))
                
                
                return (true, unwrapPixValue)
                
            } else {
                // TODO: voltar ao loop pedindo a chave
                print("valor chave invalido. TO-DO voltar ao Loop para digitar chave")
                return (false, nil)
            }
        }
        
    }
    
}

