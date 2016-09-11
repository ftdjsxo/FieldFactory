//
//  ValidatorContainer.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation

class ValidatorContainer{
    static let NOT_NULL = "NOT NULL"
    static let partitaIvaRegEx = "^[0-9]{11}$"
    static let VALIDATORS : [String : [String]] = [
        "cognome" : [ValidatorContainer.NOT_NULL],
        "piva" : [ValidatorContainer.NOT_NULL, partitaIvaRegEx],
        "codFisc" : [ValidatorContainer.NOT_NULL]]
}