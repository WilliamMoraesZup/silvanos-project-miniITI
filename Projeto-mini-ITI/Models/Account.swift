//
//  Account.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation

struct Account {
    var agency : Int?
    var accountNumber : Int? 
    var balance   = 0
 
    
    init() {
        self.agency = agencyGenerator()
        self.accountNumber =    Int.random(in: 10000..<20000)
    }
    
    private  func agencyGenerator() -> Int {
        let agencies = [1234, 3234, 4422, 4443]
         
        return  agencies[Int(arc4random_uniform(UInt32(agencies.count)))]
        
        // Aqui eu primeiro criei um ENUM para manter o registro das agencias
        // porém como nao consegui usar nome numeros no nome eu decidi ficar o array "por enquanto"
        // A soluçao seria criar um enum com o nome das agencias e cada uma teria um numero como referencia.
        // Para eu randomizar essas agencias do enum eu faria o enum herdar do protocolo CaseIterable, para me dar
        // a possibilidade de chamar o .count ao usar o arc4 random.
    }
}

enum Agency {
    case VILA_NOVA
    case _1122
}


