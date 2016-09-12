//
//  ViewController.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var cliente : ClienteBean?
    var id : String?
    var fieldsToPresent : [FieldBeanModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()

        if id != nil {
            fieldsToPresent = FieldFactory.GetSection(by: id!)
            self.title = FieldFactory.GetTitle(by: id!)
        }else{
            fieldsToPresent = FieldFactory.GetFirstSection()
            self.title = FieldFactory.GetFirstSectionTitle()
        }
    
        guard fieldsToPresent != nil else {
            fatalError("fieldsToPresent MUST NOT BE NULL")
        }
        
        prepareFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if id == nil {
            cliente = ClienteBean()
        }
    }
    
    final private func prepareFields(){
        var topField : UIView?
        for fbm in fieldsToPresent{
            let field = FieldFactory.GetFieldInstance(fbm)
            field.layer.cornerRadius = 5
            self.view.addSubview(field)
            makeOdersLRFieldCostrains(topField, field: field)
            topField = field
            
            if let fieldButton = field as? RegistrationButton{
                fieldButton.addTarget(self, action: #selector(ViewController.onButtonClick(_:)), forControlEvents: .TouchUpInside)
            }else if let textField = field as? RegistrationTextField, c = cliente{
                textField.text = c.valueForKey(textField.id!) as? String
            }
        }
    }

    
    final private func makeFirstLRFieldCostrains(field : UIView){
        field.snp_makeConstraints { (make) in
            make.top.equalTo(self.view).inset(80)
            make.left.right.equalTo(self.view).inset(20)
            make.centerX.equalTo(self.view.snp_centerX)
        }
    }
    
    final private func makeOdersLRFieldCostrains(topField : UIView?, field : UIView){
        if topField != nil{
            field.snp_makeConstraints { (make) in
                make.left.right.equalTo(self.view).inset(20)
                make.top.equalTo(topField!.snp_bottom).offset(10)
                make.centerX.equalTo(self.view.snp_centerX)
            }
        }else{
            makeFirstLRFieldCostrains(field)
        }
    }
    
    //Torna true se nono validi
    final private func validateFields() -> Bool{
        var isValid = true
        for v in self.view.subviews{
            if let textField = v as? RegistrationTextField{
                if let regexs = FieldFactory.GetValidators(byRTextField: textField){
                    regexLoop: for r in regexs{
                        if textField.validateField(withRegex: r) == false{
                            isValid = false
                            break regexLoop
                        }
                    }
                }
            }
        }
        
        return isValid
    }
    
    final private func bindMembersToBean(){
        guard cliente != nil else{
            return
        }
        for v in self.view.subviews{
            if let textField = v as? RegistrationTextField{
                if textField.text != nil{
                    if !textField.text!.isEmpty{
                        cliente?.setValue(textField.text!, forKey: textField.id!)
                    }
                }
            }
        }
    }
    
    func onButtonClick(sender : RegistrationButton?){
        guard sender != nil && validateFields() else{
            return
        }
        bindMembersToBean()
        
        if sender!.action != nil {
            let action = FieldFactory.GetAction(sender!.action!)
            let placeolder = ActionPlaceolder()
            placeolder.bean = cliente
            placeolder.currentVC = self
            action?(placeolder)
        }else{
            let vc = ViewController()
            vc.id = sender?.id
            vc.cliente = cliente
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}

