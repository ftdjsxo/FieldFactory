//
//  FieldBeanModel.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation
import UIKit

class FieldBeanModel : NSObject {
    var placeolder : String
    var type : UIView.Type
    var id : String
    var height : Double?
    
    init(placeolder: String, type: UIView.Type, id: String, height: Double?){
        self.placeolder = placeolder
        self.type = type
        self.id = id
        self.height = height
    }
}