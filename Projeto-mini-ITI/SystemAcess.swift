//
//  EnterSystem.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation

class SystemAcess {

    
    static func acessingSystem(){
    
print("""

Bem vindo ao novo aplicativo do ITI
Digite a opção desejada

1 - Transferir Agencia / Conta
2 - Pagar / Transferir com Pix
3 - Cadatrar nova Chave Pix
4 - Depositar
5 - Saldo
6 - Excluir Conta
7 - Sair
Sua escolha:
""")
        
 let selection = Int(readLine() ?? "-1") ?? -1
        switch selection {
        case 1: print("transferirAGENCIACONTA")
            
        default:
            print("fail")
        }
}

func transferAccAg(loggedUser : User){
    
}

func transferPix(){}

func registerNewPixKey(){
    
}

func deposit(){}

func balance(loggedUser : User) -> Double  {
  let balance = loggedUser.account.balance
    
    return  balance
}

func deleteAccount(){}

func exit(){}


}
