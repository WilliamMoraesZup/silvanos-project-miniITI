//
//  PaymentWithPix.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//


import Foundation

struct PaymentByPix {
    
 
    func dontHavePixYet(loggedUser : UserModel) -> Bool     {
        if loggedUser.pix.count == 0 {
            LoggedUserMenuView().warningAbsencePix()
            // Nao possui pix ainda
            return true
        }
            
            return false
        }
        
        
//        func verifyPixExistence (loggedUser : UserModel)  {
//            // verifica se o usuario possui alguma chave cadastrada
//            if loggedUser.pix.count == 0 {
//                LoggedUserMenuView().warningAbsencePix()
//
//                // Se nao possuir Pix
//                // chama o controller pra registrear novo pix
//
//                let pixResult = NewPixKey().registerNewPixKey(loggedUser: loggedUser)
//
//                if(pixResult.result){
//
//                    PaymentByPix().paymentByPix(loggedUser: loggedUser)
//                }
//            }
//
//            else {
//                PaymentByPix().paymentByPix(loggedUser: loggedUser)
//            }
//        }
//
        func paymentPix (loggedUser : UserModel) {
            if dontHavePixYet(loggedUser: loggedUser) {
                let pixReturn = NewPixKey().registerNewPixKey(loggedUser: loggedUser)
                
                if(pixReturn.result){
                    executeTransferByPix(loggedUser: loggedUser)
                     
                    
                    
                    }
                else {
                    print("houve um erro ao transferir o pix")
                }
            }
            else {
                executeTransferByPix(loggedUser: loggedUser)
            }
            
            }
           
func executeTransferByPix(loggedUser : UserModel)  {
    let view = LoggedUserMenuView()
    guard let pixToTransfer = view.inputPixKeyToTransfer() else {  return print("erro no key")    }
    
    guard let ammount = view.inputAmmountToTransferByPix() else {  return print("erro no ammout")    }
    
    if Database.instance.pixKeyExists(value: pixToTransfer){
        Database.instance.validatePixTransfer(value: pixToTransfer, ammount: ammount, from: loggedUser)
        view.showPixTransferSucess()

    }
     
    }
}
