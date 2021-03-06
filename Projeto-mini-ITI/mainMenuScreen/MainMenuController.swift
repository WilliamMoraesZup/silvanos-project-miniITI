//
//  HomeViewController.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 01/10/21.
//

import Foundation

struct HomeViewController {
 
   func startMainMenu(){
        /**
         a funçao faz um loop e a cada passagem do loop ele chama o menu principal.
         o loop chama o menu principal
         recebo um INT como retorno da funcao showMainMenu()
         o if-Let valida se esse retorno nao é nulo pois o retorno da funcao acima é Int?
         
         se nao for nulo ele chama a funcao selectedHandler, passando a variavel como argumento.
         esse funçao por sua vez vai chamar um Case para direcionar a opçao desejada para o controller especifico.
        */
         
        
        let homeView = MainMenuView()
        
        while (true) {
            // esse view retorna o numero escolhido no menu principal
            let userSelection = homeView.showMainMenu()
            
            if let validSelected = userSelection  {
                if(  selectedHandler(option: validSelected) == false) {
                    continue
                }
                else {
                    break
                }
            }
            MainMenuView().showInvalidOption()
            continue
        }
    }
    
    
    func selectedHandler(option : Int) -> Bool? {
        
        switch option {
        
        case 1:
          LoginController().login()
          self.startMainMenu()
            
        case 2:
            NewUserController().startForm()
            
        case 3:
            print("SAIR")
        
        default:
            MainMenuView().showInvalidOption()
            
            return false
        }
        
        print("Analisar por que caiu aqui")
        return true
    }
     
       
     
    
}
