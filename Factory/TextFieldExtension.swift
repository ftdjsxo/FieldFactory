//
//  TextFieldExtension.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import UIKit

extension UITextField {
    
    func validateField(withRegex regEX: String) -> Bool{
        if regEX == ValidatorContainer.NOT_NULL{
            if (self.text != nil && !self.text!.isEmpty){
                return true
            }
        }
        
        if self.text != nil{
            if NSPredicate(format:"SELF MATCHES %@", regEX).evaluateWithObject(text!){
                self.textColor = UIColor.blackColor()
                self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                    attributes:[NSForegroundColorAttributeName: UIColor.lightTextColor()])
                return true
            }
        }
        
        self.textColor = UIColor.redColor()
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        return false
    }
    
    func resetColorOnEditingChange(){
        self.textColor = UIColor.blackColor()
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                        attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
    }
}
