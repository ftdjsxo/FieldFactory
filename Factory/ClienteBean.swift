//
//  ClienteBean.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation

class ClienteBean : NSObject {
    var nome : String?
    var cognome : String?
    var codPol : String?
    var codFisc : String?
    var piva: String?
    var nomeTitolare : String?
    var cognomeTitolare : String?
    
    func toStringValue(){
        print("Nome: ", nome, "\nCognome: ",cognome,"\nCodPol: ", codPol, "\nCodFisc: ",codFisc, "\nPiv: ", piva, "\nNomeTitolare: ",nomeTitolare, "\nCognomeTitolare:", cognomeTitolare)
    }
}