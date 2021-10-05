//
//  UserModel.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation

class UserModel {
    
    let name : String
    let documentNumber : String
    var pix = [Pix]()
    var account = Account()
    
    
    
    init(name: String, documentNumber: String, account: Account){
        self.name = name
        self.documentNumber = documentNumber
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
    
   /**
     https://stackoverflow.com/questions/26180888/what-are-best-practices-for-validating-email-addresses-in-swift
     */
 
}
extension String
{
    func isEmail() -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
