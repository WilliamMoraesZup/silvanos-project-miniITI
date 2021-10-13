//
//  teste.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 08/10/21.
//


// CLASSE CRIADA PARA TESTAR A REQUISIÇAO PARA API EXTERNA
// PARA SER USADA FUTURAMENTE PRA ALIMENTAR AGENCIAS E USUARIOS
 


import Foundation
struct Api {
    func getRequest(url: String,
                     completion: @escaping ([String: Any]?, Error?) -> Void){
//        //URL válida
//        guard let URL = URL(string: url) else {
//            completion(nil, nil)
//            return
//        }
        
        // FORMA 1
      let URL = URL(string: "http://6160395dfaa03600179fb95d.mockapi.io/api/users/users")
      
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let data = data {
                    //A resposta chegou
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response as? [String : Any], nil)
                }
                else {
                    //Não houve resposta
                    completion(nil, nil)
                }
            } catch let error as NSError {
                // Houve um erro na comunicao com o servidor
                completion(nil, error)
            }
        }
           //Aciona a tarefa
        task.resume()
        
    }
    
    
    // FORMA 2
    func pegaApi(){
        let url = "http://6160395dfaa03600179fb95d.mockapi.io/api/users/users"

       getRequest(url: url){
            (resultado, erro)  in
              if(resultado != nil) {
                  //O resultado aqui vem como Opcional
                  print("Sua requisicao foi realizada com sucesso: \n \(resultado)")
              } else {
                  print("A requisicao nao funcionou")
              }
              
        }
        
    }
    
    func testeApi(){
        let url = URL(string: "http://6160395dfaa03600179fb95d.mockapi.io/api/users/users")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    }
}
