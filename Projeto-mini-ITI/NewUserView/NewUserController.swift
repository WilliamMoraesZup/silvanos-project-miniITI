//
//  NovoCadastro.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation


struct NewUserController{
    
    func startForm(){
        let newUserView = NewUserView()
      
        var validName : String?
        var validDocument : String?
        
        while true {
            if let name = newUserView.inputName(), name.count > 2 {
                validName = name
                break
            }
            
           else {
            newUserView.errorName()
            continue
           }
        }
        
        while true {
            if let document = newUserView.inputDocumentNumber() {
                //, document.count == 11{  , document.isCPF
                if Database.instance.documentAlreadyExists(value: document){
                    newUserView.errorDocumentAlreadyExists()
             //Aqui devo colocar um CONTINUE
             // Porem preciso usar algum comando para sair da tela
                    HomeViewController().startMainMenu()
                    
                }
                validDocument = document
                break
            }
           else {
            newUserView.errorDocument()
            
            continue
           }
        }
        
        let newUser = UserForm(name: validName, documentNumber: validDocument).toModel()
        
        guard let unwrapUser = newUser else {
          return  print("TO-DO error, show system error")
        }

        // salva no banco de dados estatico
        Database.instance.userDB.append(unwrapUser)
        
        // Mostra o Status da conta
        newUserView.showAccountStatus(loggedUser: unwrapUser)
    
        let loggedMenuController = LoggedUserMenuController()
        
        // inicia o controller do usuario logado
        loggedMenuController.startLoggedUserMenu(loggedUser: unwrapUser)
      
       
        
        
    }
    
    
}

  
//            guard let name = newUserV.inputName(), name.count > 2
//                else {
//                vc.errorName()
//                continue
//            }
    
//
//    static func registration() -> User {
//
//        var name : String?
//        var cpf : String?
//        var tel : String?
//        var address : String?
//        var occupation : String?
//
//
//        print("👤 Novo cadastro")
//
//        while (true) {
//            print("Digite seu nome..")
//
//            guard let newName = readLine()
//                ,!newName.isEmpty else  {
//                print("nome invalido")
//                continue
//            }
//
//            break
//        }
//
//        while (true) {
//
//            print("Digite seu CPF.. (somente números)")
//            cpf  = readLine()
//
//            if cpf == nil || cpf?.count != 11 {
//                print("CPF invalido")
//                continue
//            }
//
//            cpf = cpf!
//            break
//
//        }
//
//        while (true) {
//            print("Digite seu TELEFONE.. (somente números)")
//
//            tel = readLine()
//            if tel == nil || ((tel?.isEmpty) != nil) {
//                print("Telefone inválido")
//                continue
//            }
//            tel = tel!
//
//            break
//        }
//
//
//        while (true) {
//            print("Digite seu ENDEREÇO..  ")
//            address = readLine()
//
//            if address == nil  {
//                print("cpf invalido")
//                continue
//
//            }
//            address = address!
//            break
//        }
//
//
//        while (true) {
//            print("Digite sua OCUPAÇÃO..")
//
//            occupation = readLine()
//
//            if occupation == nil  {
//                print("ocupação inválida")
//
//                continue
//            }
//            occupation = occupation!
//            break
//        }
//        print("Digite sua RENDA..")
//        var income : String? = readLine()
//        if income == nil  {
//            print("cpf invalido")
//        }
//        income = income!
//
//
//        print("Digite sua SENHA..")
//        var pass : String? = readLine()
//        if pass == nil  {
//            print("cpf invalido")
//        }
//        pass = pass!
//
//
//        let acc = Account()
//
//        let user  = User(name: name!, cpf: cpf!, tel: tel!, address: address!, occupation: occupation!, income: income!, pass: pass!, account: // acc )
//
//
//        print("""
//                Bem vindo: \(user.name)
//                Agencia:   \(user.account.agency)
//                Conta:     \(user.account.accountNumber)
//
//                                            Saldo: \(user.account.balance)
//                """)
//
//
//        return user
//    }
//


/**
 Fonte: StackOverFlow 😜
 https://gist.github.com/LeonardoCardoso/3517ff69e4a45012fa6c8d9cbb506730
 */

extension String {
    var isCPF: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }

        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }

        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }
}
