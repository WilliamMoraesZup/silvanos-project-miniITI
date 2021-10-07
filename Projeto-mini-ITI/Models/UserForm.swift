//
//  UserForm.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation


struct UserForm {
    let name : String?
    let documentNumber : Int?
    let password : Int?
    
    
    func toModel() -> UserModel? {
        
        let newACC = Account()
        // TO-DO  remover os force unwrap
        
        return UserModel(name: name!, documentNumber : documentNumber!, password : password! , account: newACC )
     
        
    }
}

