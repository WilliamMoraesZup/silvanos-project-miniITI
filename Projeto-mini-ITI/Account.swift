//
//  Account.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 30/09/21.
//

import Foundation

class Account {
    var agency : Int {
        agencyGenerator()
    }
    var accountNumber : Int {
        Int.random(in: 10000..<20000)
        
    }
    let balance   = 0.0
 
     
    private  func agencyGenerator() -> Int {
        let agencies = [1234, 3234, 4422, 4443]
        
        return  agencies[Int(arc4random_uniform(UInt32(agencies.count)))]
    }
    
}
//    func allValues  () -> Int {
//        return Agency.allValues(Agency)
//    }



