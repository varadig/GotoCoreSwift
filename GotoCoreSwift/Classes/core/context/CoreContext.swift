//
//  CoreContext.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 04..
//
//

import UIKit

open class CoreContext: CoreBaseParameterHolder {
    
    private static var instance:CoreContext?
    
    public static func getInstance()->CoreContext{
        if instance == nil{
            instance = CoreContext()
        }
        return instance!
    }
    
    public func getString(name:String)->String{
        return self.params[name] as! String
    }
    
    public func getInt(name:String)->Int{
        return self.params[name] as! Int
    }
    
    public func getNumber(name:String)->Float{
        return self.params[name] as! Float
    }
}
