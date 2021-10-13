//
//  MainMenuView.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 01/10/21.
//

import Foundation

struct MainMenuView {
    
    
    func showMainMenu() -> Int? {
        
        print("""
    
    Bem vindo ao novo aplicativo do ITI
    Digite a opção desejada
    1 - ▶️ Entrar
    2 - 👤 Novo Cadastro
    3 - 🔚 Sair do App
    Sua escolha:
    """)
        
    let selection = Int(readLine() ?? String())
            
    return selection
}
    
    func showInvalidOption(){
        print("""
    Opção inválida, digite novamente
    
    """)
        
    }

}
