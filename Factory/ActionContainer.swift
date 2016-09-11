//
//  ActionContainer.swift
//  Factory
//
//  Created by Francesco Thiery on 11/09/16.
//  Copyright © 2016 cookedhouse. All rights reserved.
//

import Foundation
import UIKit
class ActionContainer {
    
    static let ACTIONS : [String : (AnyObject?) -> Void] = [
        "ACTION_fine": ActionContainer.SendBean,
        "ACTION_SHOW_ALERT": ActionContainer.ShowCasualAlert]
    
    
    class func SendBean(placeolder : AnyObject?){
        guard let actionPlaceolder = placeolder as? ActionPlaceolder else {
            return
        }
        
        guard actionPlaceolder.bean != nil else{
            print("Il placeolder non è un cliente")
            return
        }
        
        actionPlaceolder.bean?.toStringValue()
    }
    
    
    class func ShowCasualAlert(placeolder : AnyObject?){
        guard let actionPlaceolder = placeolder as? ActionPlaceolder else {
            return
        }
        
        let title = "Titolo"
        let desription = "blabla blabla blabla"
        let alert = UIAlertController(title: title, message: desription, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Chiudi", style: .Cancel, handler: nil))
        
        if actionPlaceolder.currentVC != nil{
            actionPlaceolder.currentVC!.presentViewController(alert, animated: true, completion: nil)
        }
    }
}


class ActionPlaceolder {
    var currentVC : UIViewController?
    var bean : ClienteBean?
}