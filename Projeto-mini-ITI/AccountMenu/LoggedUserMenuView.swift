//
//  AccountMenuView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation


struct LoggedUserMenuControllerView.swift {
    
    func showOptions() -> Int? {
        print("""

💰 DEPOSITOS / PAGAMENTOS

1 - Transferir Agencia / Conta
2 - Pagar / Transferir com Pix
3 - Cadatrar nova Chave Pix
4 - Depositar
5 - Saldo
6 - Excluir Conta
7 - Sair
Sua escolha:
""")
        
        let selection = Int(readLine() ?? String())
        return selection
    }
    
    func inputPix() -> Int? {
        print("""
Escolha o tipo de Chave Pix
1- CPF
2- Email
3- Celular
4- Chave Aleatória

Escolha sua chave..
""")
        
        
        let selection = Int(readLine() ?? String())
        
        return selection
    }
    
    func registerNewPixKeyView(){
        print("Selecione o tipo da chave")
        let keyType = Int(readLine() ?? String())
        
        
    }
}
