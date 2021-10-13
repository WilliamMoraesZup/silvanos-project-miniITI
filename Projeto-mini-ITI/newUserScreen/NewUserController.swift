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
                if  name.count > 3 {
                    return name
                }
                else if name == "0" {
                    backTo.startMainMenu()
                }
            }
            newUserView.errorName()
            return receiveName()
        }
        
        
        func receiveDocument() -> Int  {
            if let  document = newUserView.inputDocumentNumber(){
                if document == 0 {
                    backTo.startMainMenu()
                }
                
                if  String(document).isCPF {
                    if  DbQueries().existsByDocument(value: document){
                        newUserView.errorDocumentAlreadyExists()
                        HomeViewController().startMainMenu()
                    }
                    return document
                }
            }
            
            newUserView.errorDocument()
            return receiveDocument()
        }
        
        func receivePassword() -> Int  {
            
            if let pass = newUserView.inputPassword(){
                if pass == 0 {
                    backTo.startMainMenu()
                }
                if  String(pass).count > 5 {
                    return pass
                }
            }
            
            newUserView.errorPassword()
            return receivePassword()
        }
        
        func receiveAddress() -> String  {
            
            if let address = newUserView.inputAddress(){
                if address == "0" {  backTo.startMainMenu()}
                if address.count > 5 {
                    return address   }
            }
            
            newUserView.errorAddress()
            return receiveAddress()
            
            
        }
        func receiveOccupation() -> String  {
            
            if let occupation =  newUserView.inputOccupation(){
                if occupation == "0" {
                    backTo.startMainMenu()
                }
                
                if occupation.count > 3 {
                    return occupation
                }
            }
            newUserView.errorOcupation()
            return receiveOccupation()
        }
        
        func receiveIncome() -> Double  {
            
            if let income = newUserView.inputIncome() {
                if income == 0 {
                    backTo.startMainMenu()
                }
                else {
                    return income
                }
            }
            newUserView.errorIncome()
            return receiveIncome()
        }
        
        
        func receiveTel() -> Int  {
            
            if let tel = newUserView.inputTel(){
                if tel == 0 {
                    backTo.startMainMenu()
                }
                
                if String(tel).count > 8 {
                    return tel
                }
            }
            
            newUserView.errorTel()
            return receiveTel()
            
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
         
    }
    
}



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



//Codigo de estimaçao
//
//  Abstraçao do Loop para ser usada no futuro
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





