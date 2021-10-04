//
//  Usuario.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation


class User {
    
    var name : String
    var cpf : String
    var tel : String
    var address : String
    var occupation :  String
    var income : String
    var pass : String
    var account : Account
    var pixKey = [PixKey]()
    // Duvida entre usar ? no account ou nao
 
    init(name : String,
      cpf : String,
      tel : String,
      address : String,
      occupation :  String,
      income : String,
      pass : String,
      account : Account) {
        
        self.name = name
        self.cpf = cpf
        self.tel = tel
        self.address = address
        self.occupation = occupation
        self.income = income
        self.pass = pass
        self.account = account
    }
}

struct PixKey {
    let key : String?
}
