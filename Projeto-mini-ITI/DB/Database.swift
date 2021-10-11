//
//  DataBase.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 03/10/21.
//

import Foundation


struct Database {
    
    var userDB = [UserModel]()
    
    static var instance = Database()
    
    private init() { }
    
  
    
}



