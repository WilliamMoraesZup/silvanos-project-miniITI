//
//  UserModel.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation

class UserModel {
    
    let name : String
    let documentNumber : Int
    let tel : Int
    let address : String
    let ocupation : String
    let income : Double
    let password : Int
    var pix = [Pix]()
    var account = Account()
    
    

    init(name: String, documentNumber: Int,
         tel : Int, address : String,
         ocupation : String, income : Double,
         password : Int, account: Account){
        
        self.name = name
        self.documentNumber = documentNumber
        self.tel = tel
        self.address = address
        self.ocupation = ocupation
        self.income = income
        self.password = password
        self.account = account

    }

    func addNewPixKey(pixKey : Pix){
        self.pix.append(pixKey)
    }
    
    func creditValue(value : Int){
        self.account.balance += value
    }
    
    func debitValue(value : Int) -> Bool{
        if value >= self.account.balance {
            return false
        }
        else {
            self.account.balance -= value
            return true
        }
    }
    
    func generateRandomNumber() -> String {
        return UUID().uuidString
     }
   
}

struct Pix{
    let value : String
    let type : PixType

}


enum PixType : Int {
    case CPF = 1
    case EMAIL
    case CELULAR
    case RANDOM_KEY
    
     
    func validate(value : String) -> Bool{
        //TO-DO novas validacoes para celular
        
        switch self {
        case .CPF: return value.isCPF
        case .CELULAR: return value.count >= 8
        case .EMAIL: return value.isEmail()
        case .RANDOM_KEY:
        print(UUID.init())
            return true
         
        }
    }
    
}
