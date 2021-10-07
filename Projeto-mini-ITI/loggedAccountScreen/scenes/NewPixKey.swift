//
//  RegisterNewPix.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 06/10/21.
//

import Foundation

struct NewPixKey{
    
    func registerNewPixKey(loggedUser : UserModel) -> (result: Bool, pixValue: String?) {
        let view = LoggedUserMenuView()
        
        guard let unwrapPixOption = view.inputPixType() else {
            return (false, nil)
        }
        
        guard let unwrapPixType = PixType(rawValue: unwrapPixOption) else {
            return  (false, nil) }
        
        // OPÇAO ESCOLHIDA - RANDOM KEY
        
        if unwrapPixType == .RANDOM_KEY {
            let randomValue =   UUID().uuidString
            loggedUser.addNewPixKey(
                pixKey: Pix.init(
                    value: randomValue,
                    type: unwrapPixType))
            view.showPixRegisterSucess()
            //finalizo a funçao
            return (true, randomValue)
            
        }
        
        
        else {
            // Visto que a opçao escolhida nao foi RANDOM
            // agora peço o valor da chave
            // se a chave for valida sera salva na classe
            guard let unwrapPixValue = view.inputPixValue() else   {
                print("tipo invalido")
                return (false , nil)
            }
            
            //chama a funcao para conferir se a chave já existe
            if (Database.instance.pixKeyAlreadyExists(value: unwrapPixValue)){
                print("Essa chave já se encontra cadastrad")
                
                // FIXME: essa parte esta ambigua
                // arrumar com o loop
                return (true , nil)
            }
            //Valida a chave atraves do ENUM
            // Finaliza salvando o Pix no usuario
            if  unwrapPixType.validate(value: unwrapPixValue) {
                loggedUser.addNewPixKey(pixKey: Pix.init(
                                            value: unwrapPixValue,
                                            type: unwrapPixType))
                view.showPixRegisterSucess()
                
                return (true, unwrapPixValue)
                
            } else {
                // TODO: voltar ao loop pedindo a chave
                print("valor chave invalido. TO-DO voltar ao Loop para digitar chave")
                return (false, nil)
            }
        }
        
    }
}
