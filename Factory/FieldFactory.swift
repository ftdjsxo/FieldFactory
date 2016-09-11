//
//  FieldFactory.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class FieldFactory {
    
    private static let NAVIGATION_FLOW_MAP : [String : [FieldBeanModel]] = [
        "pippo_id": FormContainer.pippo,
        "pluto_id": FormContainer.pluto,
        "pippo_2_id": FormContainer.pippo2,
        "pluto_2_id": FormContainer.pluto2]
    
    private static let TITLES : [String : String] = [
        "pippo_id": "Cliente 1",
        "pluto_id": "Azienda 1",
        "pippo_2_id": "Cliente 2",
        "pluto_2_id": "Azienda 2"]
    
    //private static var FIELD_SINGLETON_MAP = NSMutableDictionary()
    
    
    class func GetFirstSectionTitle() -> String{
        return "Inizio"
    }
    
    class func GetTitle(by id: String) -> String?{
        return TITLES[id]
    }
    
    class func GetFirstSection() -> [FieldBeanModel]{
        return FormContainer.firstPage
    }
    
    class func GetSection(by id: String) -> [FieldBeanModel]?{
        return FieldFactory.NAVIGATION_FLOW_MAP[id]
    }
    
    class func GetFieldInstance(fieldBeanModel: FieldBeanModel) -> UIView{
        let field = fieldBeanModel.type.init()
        if let button = field as? RegistrationButton{
            SetButton(fieldBeanModel, button: button)
        }else if let textField = field as? RegistrationTextField {
            SetTextField(fieldBeanModel, textField: textField)
        }else if let label = field as? UILabel {
            SetLabel(fieldBeanModel, label: label)
        }

        guard let height = fieldBeanModel.height else {
            field.snp_makeConstraints { (make) -> Void in
                make.height.equalTo(50)
            }
            return field
        }
        
        field.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(height)
        }
        
        return field
    }
    
    
    class func GetAction(actionID : String) -> ((AnyObject?) -> Void)?{
        return ActionContainer.ACTIONS[actionID]
    }
    
    
    private class func SetButton(beandModel : FieldBeanModel, button : RegistrationButton){
        button.setTitle(beandModel.placeolder, forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.backgroundColor = UIColor.whiteColor()
        if beandModel.id.containsString("ACTION_"){
            button.action = beandModel.id
        }else{
            button.id = beandModel.id
        }
    }
    
    private class func SetTextField(beandModel : FieldBeanModel, textField : RegistrationTextField){
        textField.id = beandModel.id
        textField.placeholder = beandModel.placeolder
        textField.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.6)
    }
    
    private class func SetLabel(beandModel : FieldBeanModel, label : UILabel){
        label.text = beandModel.placeolder
        label.numberOfLines = 0
        label.text = beandModel.placeolder
        label.textColor = UIColor.lightGrayColor()
    }
}