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
            UserMenuView().warningAbsencePix()
            // Nao possui pix ainda
            return true
        }
            
            return false
        }
         
        func paymentPix (loggedUser : UserModel) {
            if dontHavePixYet(loggedUser: loggedUser) {
                let pixReturn = NewPixKey().registerNewPixKey(loggedUser: loggedUser)
                
                if(pixReturn.result){
                    executeTransferUsingPix(loggedUser: loggedUser)
                      }
                else {
                    print("houve um erro ao criar um novo pix")
                }
            }
            else {
                executeTransferUsingPix(loggedUser: loggedUser)
            }
            
            }
           
func executeTransferUsingPix(loggedUser : UserModel)  {
    let view = UserMenuView()
    guard let pixToTransfer = view.inputPixKeyToTransfer() else {  return print("erro no key")    }
    
    guard let ammount = view.inputAmmountToTransferByPix() else {  return print("erro no ammout")    }
    
    if DbQueries().existsByPixKey(value: pixToTransfer),
       DbQueries().validatePixTransfer(value: pixToTransfer, ammount: ammount, from: loggedUser) {
        
        view.showPixTransferSucess()

    }
     
    }
}
