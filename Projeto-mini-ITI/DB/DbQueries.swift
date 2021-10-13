//
//  dbCommands.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 11/10/21.
//

import Foundation
struct DbQueries {
    
    var userDB = Database.instance.userDB
   
    
    func insertIntoUserDB(user : UserModel)   {
        Database.instance.userDB.append(user)
    }
    
    func deleteByDocument(user : UserModel)   {
        guard let index = Database.instance.userDB.firstIndex(where: { $0.documentNumber == user.documentNumber})
        else {
            return print("Conta nao encontrada")
        }
        Database.instance.userDB.remove(at: index)
     
    }
    
    func existsByDocument(value : Int) -> Bool {
        return userDB.contains(where: { $0.documentNumber == value })
    }
     
    func existsByPixKey(value : String ) -> Bool {
        return userDB.flatMap({ $0.pix }).contains(where: { $0.value == value})
    }
     
    func existsByAgency(value : Int ) -> Bool{
        return userDB.contains(where: { $0.account.agency == value })
    }
    
    func existsByAccount(value : Int ) -> Bool{
        return userDB.contains(where: { $0.account.accountNumber == value})
    }
     
    func findUserByDocumentAndPassword(userDocument : Int, pass: Int) -> UserModel? {
        return  userDB.first {
            $0.documentNumber == userDocument && $0.password == pass }
        
    }
    
    
    // Preciso refatorar essas 2 funçoes pois elas nao representam querie no DB
    func validateTransfer(agency : Int, acc : Int, ammount: Int, loggedUser : UserModel ) -> Bool {
        let userFound =  userDB.first(where:{$0.account.agency == agency })
        
        if userFound?.account.accountNumber != acc {
            print("os dados estao divergentes")
            return false
        }
        
        if !loggedUser.debitValue(value: ammount){
            print("Você nao possui saldo para essa transferencia")
            return false
        }
        
        userFound?.creditValue(value: ammount)
        print("transferencia bem sucedida")
        return true
    }
    
    func validatePixTransfer(value: String, ammount: Int, from: UserModel) -> Bool {
        let found = userDB.first(where: { $0.pix.contains(where: { $0.value == value}) })
        
        if   from.debitValue(value: ammount){
            found?.creditValue(value: ammount)
            return true
        }
        return false
    }
    
}
