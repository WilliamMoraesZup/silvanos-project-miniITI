//
//  NewUserView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 01/10/21.
//

import Foundation

struct NewUserView {
    
    func showAccountStatus(acc: AccountExhibition){
     print("""

Bem vindo: \(acc.name)
Agencia:   \(acc.agency)
Conta:     \(acc.acc)

                   Saldo: \(acc.showBalance())
""")
    }
    
    func inputName() -> String? {
        print("\nDigite seu nome..")
        
        return readLine() 
    }
    
    func inputDocumentNumber() -> Int? {
        print("\nDigite seu CPF, somente numeros..")
        
        return Int(readLine() ?? String())
    }
    
    func inputPassword() -> Int? {
        print("\nDigite sua senha, deve possuir no minimo 6 numeros..")
        
        return Int(readLine() ?? String())
    }
    
    func inputAddress() -> String? {
        print("\nDigite seu endereço..")
        
        return  readLine()
    }
    
    func inputOccupation() -> String? {
        print("\nDigite sua ocupação..")
        
        return  readLine()
    }
    
    func inputTel() -> Int? {
        print("\nDigite seu telefone.. (somente números)")
       
        return Int(readLine() ?? String())
    }
    
    func inputIncome() -> Double? {
        print("\nDigite sua renda.. ")
       
        return Double(readLine() ?? String())
    }
    
    func errorName(){
        print("Nome inválido, digite novamente.. \n")
    }
    
    func errorDocument(){
        print("CPF inválido, digite novamente.. \n")
    }
    
    func errorPassword(){
        print("A senha deve conter no minimo 6 numeros. Digite novamente.. \n")
    }
    
    func errorAddress(){
        print("Endereço inválido.. \n")
    }
    
    func errorOcupation(){
        print("Ocupação inválida.. \n")
    }
     
    func errorIncome(){
        print("Renda inválida.. \n")
    }
     
    func errorTel(){
        print("Telefone inválido, digite apenas numeros.. \n")
    }
  
    func errorDocumentAlreadyExists(){
        print("Esse CPF já se encontra cadastrado.. \n")
    }
    
    
}

