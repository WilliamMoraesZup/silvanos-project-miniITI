//
//  LoginView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation


struct LoginView {
    
    func inputDocumentNumber() -> Int? {
        print("""
            Digite seu CPF
            """)
        
        return Int(readLine() ?? String())
    }
    
    func inputPassword() -> Int? {
        print("""
            Digite sua senha
            """)
        
        return Int(readLine() ?? String())
    }
    
         
    
    
    
    
}
