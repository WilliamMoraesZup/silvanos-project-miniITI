//
//  TransferAgAcc.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation


struct TransferAgAcc {
    func transfer(loggedUser : UserModel){
        
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
}
