//
//  AlertController.swift
//  GotoCoreSwift
//
//  Created by Gábor Váradi on 2018. 01. 04..
//  Copyright © 2018. CocoaPods. All rights reserved.
//

import UIKit
import GotoCoreSwift

public class AlertController: CoreBaseClass
{
    /*SERVICES*/
    public static let SHOW_ALERT:String = "alert.controller.show.alert"
    /*PARAMS*/
    public static let TITLE:String = "alert.controller.title"
    public static let MESSAGE:String = "alert.controller.message"
    public static let VC:String = "alert.controller.vc"
    
    private static var instance:AlertController?
    public static func getInstance()->AlertController{
        if instance == nil{
            instance = AlertController()
        }
        return instance!
    }
    
    public override init(){
        super.init()
        self.sc.registerService(name: AlertController.SHOW_ALERT, reference: self.serviceShowAlert)
    }
    
    private func serviceShowAlert(params:[String:Any])->Void{
        let alert = UIAlertController(title: params[AlertController.TITLE] as! String, message: params[AlertController.MESSAGE] as! String,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        let viewController:GUIViewController = params[AlertController.VC] as! GUIViewController
        viewController.present(alert, animated: true, completion: nil)
        
        
        
    }
    
}
