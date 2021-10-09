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
    let tel : Int?
    let address : String?
    let ocupation : String?
    let income : Double?
    let password : Int?
    
    
    func toModel() -> UserModel? {
        
        let newACC = Account()
        // TO-DO  remover os force unwrap
        
        
        guard
            let unwrapedName = name,
            let unwrapedDocumentoNumber = documentNumber,
            let unwrapedTel = tel,
            let unwrapedAddress = address,
            let unwrapedOcupation = ocupation,
            let unwrapedIncome = income,
            let unwrapedPassword = password
                 else {
            print("Erro ao criar MOdel")
            return nil
        }
        
        return UserModel(name: unwrapedName, documentNumber : unwrapedDocumentoNumber,
                         tel: unwrapedTel,
                         address: unwrapedAddress,
                         ocupation: unwrapedOcupation,
                         income: unwrapedIncome,
                         password : unwrapedPassword,
                         account: newACC )
     
        
    }
}

