//
//  TransferAgAcc.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation


struct TransferAgAcc {
    func transfer(loggedUser : UserModel){
        
        let view = UserMenuView()
        
        guard let toAgency = view.inputAgToTransfer() else {
            return view.invalidAgency()
        }
        
//        if (!Database.instance.agencyExists(value: toAgency)) {
//            print("Agencia não encontrada")
//            return
//        }
        
        guard let toAccount = view.inputAccToTransfer() else {
            return view.invalidAcc()
        
        
        }
        
        if (!Database.instance.accountExists(value: toAccount)){
            return view.accountNotFound()
        
        }
        
        guard let ammount = view.inputAmmountToTransfer() else {
            return view.invalidAmmount()
        }
        
        if Database.instance.validateTransfer(agency: toAgency, acc: toAccount, ammount: ammount, loggedUser : loggedUser){
            
            view.sucessTransfer()
            
            view.showBalance(value: String( loggedUser.account.balance))
        }
        else {
            view.errorTransfer()
        }
    }
}
