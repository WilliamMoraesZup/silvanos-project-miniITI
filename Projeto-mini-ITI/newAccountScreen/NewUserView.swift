//
//  NewUserView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 01/10/21.
//

import Foundation

struct NewUserView {
    
    func showAccountStatus(loggedUser: UserModel){
        
        guard let agency = loggedUser.account.agency,let account = loggedUser.account.accountNumber else { return }
        print("""

Bem vindo: \(loggedUser.name)
Agencia:   \(agency)
Conta:     \(account)

                    Saldo: \(loggedUser.account.balance)
""")
        
    }
    
    func inputName() -> String? {
        print("Digite seu nome..")
     
        return readLine()
        
    }
    
    func inputDocumentNumber() -> Int? {
        print("Digite seu CPF..")
         
        return Int(readLine() ?? String())
        
    }
    func inputPassword() -> Int? {
        print("Digite sua senha..")
         
        return Int(readLine() ?? String())
        
    }
    
    
    func errorName(){
        print("\n Nome inválido, digite novamente.. ")
    }
    func errorDocument(){
        print("\n CPF inválido, digite novamente.. \n")
    }
    
    func errorPassword(){
        print("\n Senha inválida, digite novamente.. \n")
    }
    func errorDocumentAlreadyExists(){
        print("\n Esse CPF já se encontra cadastrado.. \n")
    }
    
    
}
