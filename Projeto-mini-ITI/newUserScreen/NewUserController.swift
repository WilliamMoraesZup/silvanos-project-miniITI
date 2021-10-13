//
//  NovoCadastro.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation


struct NewUserController{
    let backTo  = HomeViewController()
    
    func startForm(){
        let newUserView = NewUserView()
        
        let validName = receiveName()
        let validDocument = receiveDocument()
        let validPassword = receivePassword()
        let validAddress = receiveAddress()
        let validOccupation = receiveOccupation()
        let validTel = receiveTel()
        let validIncome = receiveIncome()
  
       
        
        func receiveName() -> String  {
            if let name =  newUserView.inputName(){
                if name == "0" {
                    backTo.startMainMenu()
                     }
                else
                if  name.count > 3 {
                    return name
            }
             
            }
            newUserView.errorName()
            return receiveName()
       
        }
        
        func receiveDocument() -> Int  {
            guard  let  document = newUserView.inputDocumentNumber(),     String(document).isCPF
            else {
                newUserView.errorDocument()
                return receiveDocument()
            }
            
            if  DbQueries().existsByDocument(value: document){
                newUserView.errorDocumentAlreadyExists()
                HomeViewController().startMainMenu()
            }
            
            return document
        }
        func receivePassword() -> Int  {
            guard  let  pass = newUserView.inputPassword(), String(pass).count > 5
            else {
                newUserView.errorPassword()
                return receivePassword()
            }
            return pass
        }
        
        func receiveAddress() -> String  {
            guard  let address = newUserView.inputAddress(), address.count > 5
            else {
                newUserView.errorAddress()
                return receiveAddress()
            }
            return address
            
        }
        
        func receiveOccupation() -> String  {
            guard  let occupation = newUserView.inputOccupation()
            else {
                newUserView.errorOcupation()
                return receiveOccupation()
            }
            return occupation
        }
        func receiveIncome() -> Double  {
            guard  let income = newUserView.inputIncome() else {
                newUserView.errorIncome()
                return receiveIncome()
            }
            return income
        }
        
        
        func receiveTel() -> Int  {
            guard  let tel = newUserView.inputTel()
            else {
                newUserView.errorTel()
                return receiveTel()
            }
            return tel
        }
        let newUser =
            UserForm(name: validName,
                     documentNumber: validDocument,
                     tel: validTel,
                     address: validAddress,
                     ocupation: validOccupation,
                     income: validIncome,
                     password: validPassword)
            .toModel()
        
        
        guard let unwrapUser = newUser else {
            return  print("TO-DO erro apos criar o usuario, show system error")
        }
        
        DbQueries().insertIntoUserDB(user: unwrapUser) // salva no banco de dados estatico
        
        newUserView.showAccountStatus(acc: AccountExhibition(user: unwrapUser))
        UserMenuController().startUserMenu(loggedUser: unwrapUser) // inicia o controller do usuario logado
        
        
        // REFATOREI E REMOVI OS WHILES para melhorar a legibilidade
        //  agora consigo ver de onde vem o valor de cada variavel sem me perdernas funcoe
        //               while true {
        //            if let name = newUserView.inputName(), name.count > 2 {
        //                validName = name
        //                break
        //            }
        //
        //           else {
        //            newUserView.errorName()
        //            continue
        //           }
        //        }
        
    }
    
}










// Abstraçao do Loop para ser usada no futuro
//        func loop(input : String?, inputType : Input, postView: () -> Void ){
//            while true {
//            if let name = input, name.count // > 2 {
//                validName = name
//            }
//           else {
//            postView()
//           }
//        }
//        }
//
// preciso incluir uma forma de validaçao baseado no tipo de entradas
//        loop(input: newUserView.inputName(), inputType: .name, postView: newUserView.errorName)
//        loop(input: newUserView.inputDocumentNumber(), inputType: .documentNumber, postView: newUserView.errorDocument)
//        loop(input: newUserView.inputPassword(), inputType: .password, postView: newUserView.errorPassword)
//    }
//
//    enum Input{
//        case name
//        case documentNumber
//        case password
//        case address
//        case email
//
//        // perguntar para o mentor
//        func validate(value : Any) -> Bool{
//            switch self {
//            case .name:
//                return (value as! String).count > 2
//            case .documentNumber:
//                return (value as! String).isCPF
//            case .password:
//                return (value as! String).count > 5
//            case .address:
//                return (value as! String).count > 3
//            case .email:
//                return (value as! String).isEmail()
//            default:
//                return false
//            }
//
//        }
//    }





