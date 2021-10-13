//
//  AccountMenuView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 02/10/21.
//

import Foundation


struct UserMenuView {
    
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
    
    func inputPixType() -> Int? {
        print("""
Escolha o tipo de Chave Pix
1- CPF
2- Email
3- Celular
4- Chave Aleatória

""")
        
        let selection = Int(readLine() ?? String())
        return selection
        
    }
    
    func inputPixValue() -> String? {
        print("""
Digite a sua chave..

""")
         
        return readLine() ?? String()
        
    }
    func newPixSucessMsg() {
        print("""
        
        Chave pix cadastrada com sucesso
        """)
    }
    func  warningAbsencePix(){
        print("""
            
            Parece que você ainda não cadastrou nenhuma chave pix.
            Cadastre uma agora.
            
            """)
    }
    
    func inputDepositValue() -> Int? {
        print("""
            
            Valor a ser depositado na conta..
            * Valor em REAIS
            
            """)
        
        return Int(readLine() ?? String())
    }
    
    func showDepositSucess(){
        print("""
            
            Deposito realizado com sucesso!
            
            """)
        
    }
    
    func showPixTransferSucess(){
        print("""
            
            Transferencia pix realizada com sucesso!
            
            """)
    }
    
    func showBalance(value : String){
        print("""
            
            Seu saldo:   R$ \(value) reais.
            
            """)
        
    }
    func showPixRegisterSucess( ){
        
        print("""
            
            Chave Pix Cadastrada com sucesso!
            
            """)
        
    }
    
    func inputAgToTransfer()  -> Int? {
        print("""
            
            Digite a Agencia de destino..
            """)
        
        return Int(readLine() ?? String())
    }
    
    func inputAccToTransfer() -> Int? {
        print("""
            
            Digite a Conta de destino..
            """)
        return Int(readLine() ?? String())
    }
    
    func inputAmmountToTransfer() -> Int? {
        print("""
            Digite a quantia a ser transferida..
            """)
        
        return Int(readLine() ?? String())
    }
    
    func inputPixKeyToTransfer() -> String? {
        print("""
            Digite o pix da conta de destino..
            """)
        
        return readLine() ?? String()
    }
    func inputAmmountToTransferByPix() -> Int? {
        print("""
            Digite a quantia a ser transferida..
            """)
        
        return Int(readLine() ?? String())
    }
    
    func invalidAgency(){
        print("""
            Agencia inválida, digite somente números..
            
            """)
    }
    func invalidAcc(){
        print("""
            Conta inválida, digite somente números..
            
            """)
    }
    
    func accountNotFound(){
        print("""
            Conta não encontrada..
            
            """)
    }
    
    func invalidAmmount(){
        print("""
            Quantidade inválida..
            
            """)
    }
    
    func sucessTransfer(){
        print("""
            Transferencia realizada com sucesso..
            
            """)
    }
 
    func sucessAccountExcluded(){
        print("""
            Conta finalizada com sucesso..
            
            """)
    }
    func errorBalancesNeedsToBeZero(){
      print("""
        Você precisa deixar seu saldo zerado antes de finalizar sua conta
        
        """)
    }
   
    func errorTransfer(){
        print("""
            Houve um problema com a transferencia, tente novamente..
            
            """)
    }
}

