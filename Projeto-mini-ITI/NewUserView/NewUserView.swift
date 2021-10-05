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
        let name  = readLine()
        return name
        
    }

    func inputDocumentNumber() -> String? {
        print("Digite seu CPF..")
        let documentNumber  = readLine()
        return documentNumber
        
    }

func errorName(){
    print("\n Nome inválido, digite novamente.. ")
}
func errorDocument(){
    print("\n CPF inválido, digite novamente.. \n")
}
    func errorDocumentAlreadyExists(){
    print("\n Esse CPF já se encontra cadastrado.. \n")
}



//    func inputDocumentNumber() -> String? {
//        var validInput : String?
//
//        while (true) {
//            print("Digite seu CPF..")
//
//            if let documentNumber  = readLine(),
//               !documentNumber.isEmpty, documentNumber.count == 11 {
//                validInput = documentNumber
//                break
//            }
//                print("CPF inválido, digite novamente..")
//            continue
//        }
//
//        return validInput
//}
//
//        while (true) {
//
//            print("Digite seu CPF.. (somente números)")
//            guard let cpf  = readLine()
//
//            if cpf == nil || cpf.count != 11 {
//                print("CPF invalido")
//                continue
//            }
//
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
//    }



}
