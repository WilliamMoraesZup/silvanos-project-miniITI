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
    
    
    func userNotFound(){
        print("\nUsuário não encontrado.. \n")
    }
    
    
    func errorInvalidLogin(){
        print("\nLogin Invalido, o cpf deve conter apenas numeros.. \n")
    }
    
    func errorInvalidPass(){
        print("\nPassword Invalido, a senha deve conter apenas números.. \n")
    }
    
    
}
