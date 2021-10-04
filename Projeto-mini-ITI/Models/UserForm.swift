//
//  UserForm.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation


struct UserForm {
    let name : String?
    let documentNumber : String?
    
    
    
    func toModel() -> UserModel? {
        
        let newACC = Account()
        
        return UserModel(name: name!, documentNumber : documentNumber!, account: newACC)
     
        
    }
}

