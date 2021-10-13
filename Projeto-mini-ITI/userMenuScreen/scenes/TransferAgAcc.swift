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
        
        guard let toAccount = view.inputAccToTransfer() else {
            return view.invalidAcc() 
        }
        
        if (!DbQueries().existsByAccount(value: toAccount)){
            return view.accountNotFound()
        
        }
        
        guard let ammount = view.inputAmmountToTransfer() else {
            return view.invalidAmmount()
        }
        
        if DbQueries().validateTransfer(agency: toAgency, acc: toAccount, ammount: ammount, loggedUser : loggedUser){
            
            view.sucessTransfer()
            
            view.showBalance(value: String( loggedUser.account.balance))
        }
        else {
            view.errorTransfer()
        }
    }
}
