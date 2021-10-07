//
//  DataBase.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 03/10/21.
//

import Foundation


struct Database {
    
    var userDB = [UserModel]()
    
    static var instance = Database()
    
    private init() {
    }
    
    // verifica se o CPF ja existe no array de usuarios
    func documentAlreadyExists(value : Int) -> Bool {
        return userDB.contains(where: { $0.documentNumber == value })
    }
    
    
    func pixKeyAlreadyExists(value : String ) -> Bool {
        
        let existsKey  = userDB.flatMap({ $0.pix }).contains(where: { $0.value == value})
        
        if existsKey {
            print("Não foi possivel cadastrar essa chave pois ela já se encontra registrada")
            return true
        }
        return false
    }
    
    func agencyExists(value : Int ) -> Bool{
        return userDB.contains(where: { $0.account.agency == value })
    }
    
    func accountExists(value : Int ) -> Bool{
        return userDB.contains(where: { $0.account.accountNumber == value})
    }
    
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
        print("transferencia bem sucedidade")
        return true
    }
    
    func validatePixTransfer(value: String, ammount: Int, from: UserModel) -> Bool {
        let found = userDB.first(where: { $0.pix.contains(where: { $0.value == value}) })
        
        if   from.debitValue(value: ammount){
            found?.creditValue(value: ammount)
        }
        return true
    }
    
    func pixKeyExists(value : String) -> Bool {
        return   userDB.flatMap({$0.pix}).contains(where: {$0.value == value})
    }
    
    
    
    func validateLogin(userDocument : Int, pass: Int) -> UserModel? {
        
        print(userDocument)
print(pass)
        let userFound = userDB.first {
            $0.documentNumber == userDocument && $0.password == pass }
        
        print(userFound)
         return userFound
    }
    
    
    
}



