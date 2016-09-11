//
//  FormContainer
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation
import UIKit

class FormContainer {
    static let firstPage : [FieldBeanModel] = [
        FieldBeanModel.init(placeolder: "Questo è un testo molto casuale e sarà alto 60px", type: UILabel.self, id: "", height: 60),
        FieldBeanModel.init(placeolder: "Pippo", type: RegistrationButton.self, id: "pippo_id", height: nil),
        FieldBeanModel.init(placeolder: "Pluto", type: RegistrationButton.self, id: "pluto_id", height: nil)]
    
    static let pippo : [FieldBeanModel] = [
        FieldBeanModel.init(placeolder: "Nome Contraente", type: RegistrationTextField.self, id: "nome", height: nil),
        FieldBeanModel.init(placeolder: "Congnome Contraente", type: RegistrationTextField.self, id: "cognome", height: nil),
        FieldBeanModel.init(placeolder: "Prosegui", type: RegistrationButton.self, id: "pippo_2_id", height: nil)]
    
    static let pippo2 : [FieldBeanModel] = [
        FieldBeanModel.init(placeolder: "Codice Polizza", type: RegistrationTextField.self, id: "codPol", height: nil),
        FieldBeanModel.init(placeolder: "Codice Fiscale", type: RegistrationTextField.self, id: "codFisc", height: nil),
        FieldBeanModel.init(placeolder: "Fine", type: RegistrationButton.self, id: "ACTION_fine", height: nil)]
    
    static let pluto : [FieldBeanModel] = [
        FieldBeanModel.init(placeolder: "Partita IVA", type: RegistrationTextField.self, id: "piva", height: nil),
        FieldBeanModel.init(placeolder: "Nome Titolare", type: RegistrationTextField.self, id: "nomeTitolare", height: nil),
        FieldBeanModel.init(placeolder: "Cognome Titolare", type: RegistrationTextField.self, id: "cognomeTitolare", height: nil),
        FieldBeanModel.init(placeolder: "Prosegui", type: RegistrationButton.self, id: "pluto_2_id", height: nil)
    ]
    
    static let pluto2 : [FieldBeanModel] = [
        FieldBeanModel.init(placeolder: "Codice Polizza", type: RegistrationTextField.self, id: "codPol", height: nil),
        FieldBeanModel.init(placeolder: "Fine", type: RegistrationButton.self, id: "ACTION_SHOW_ALERT", height: nil)]
    
}