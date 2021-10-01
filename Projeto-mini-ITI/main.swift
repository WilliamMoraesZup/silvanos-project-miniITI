//
//  main.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation

var usersDB = [User]()
private var loggedUser : User?



print("""
Bem vindo ao novo aplicativo do ITI
Digite a opção desejada

1 - ▶️ Entrar
2 - 👤 Novo Cadastro
3 - 🔚 Sair do App
Sua escolha:
""")

private let selection = Int(readLine() ?? "-1") ?? -1


var menu  = MainMenuOptions(rawValue: selection)


while true {
switch menu {
case .ENTRAR:
print("Entrar")
    
case .NOVO_CADASTRO:
  loggedUser =  NewUser.registration()
    SystemAcess.acessingSystem()
    
    
case .SAIR:
    print("SAIR")
    
case .none:
    print("opçao invalida")
}
}
