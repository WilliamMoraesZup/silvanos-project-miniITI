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
    
}

struct Pix{
    let value : String
    let type : PixType?

}

enum PixType {
    case CPF
    case EMAIL
    case CELULAR
    case RANDOM_KEY
}
