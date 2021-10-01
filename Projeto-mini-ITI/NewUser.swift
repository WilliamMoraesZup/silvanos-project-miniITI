//
//  NovoCadastro.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation


class NewUser {
    
    
    static func registration() -> User {
        
        print("""
👤 Novo cadastro
Digite seu nome..
""")
        let name = readLine()
        
        print("Digite seu CPF.. (somente números)")
        let cpf = readLine()
        
        print("Digite seu TELEFONE.. (somente números)")
        let tel = readLine()
        
        print("Digite seu ENDEREÇO..  ")
        let adress = readLine()
        
        print("Digite sua OCUPAÇÃO..")
        let occupation = readLine()
        
        print("Digite sua RENDA..")
        let income = readLine()
        
        print("Digite sua SENHA..")
        let pass = readLine()
        
        let acc = Account()
        
        let user  = User(name: name, cpf: cpf, tel: tel, adress: adress, occupation: occupation, income: income, pass: pass, account: acc )
 
        if let userName = user.name  {
            print("""
                Bem vindo: \(userName)
                Agencia:   \(user.account.agency)
                Conta:     \(user.account.accountNumber)
                
                                            Saldo: \(user.account.balance)
                """)
    }
        
            return user
        }
          
    }
    

