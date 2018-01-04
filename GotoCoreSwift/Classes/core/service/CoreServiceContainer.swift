//
//  CoreServiceContainer.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

public class CoreServiceContainer: NSObject {
        
    public typealias Reference = (Dictionary<String,Any>)->Any?

    private static var instance:CoreServiceContainer?
    public static func getInstance()->CoreServiceContainer
    {
        if(CoreServiceContainer.instance==nil){
            CoreServiceContainer.instance = CoreServiceContainer()
            
        }
        return CoreServiceContainer.instance!
    }
    
    private var mapping:Dictionary<String,Reference> = [String:Reference]();
    
    public func registerService(name:String, reference:@escaping Reference)->Void{
        self.mapping[name] = reference;
    }
    public func getService(name:String)->IExecutable{
        if(!self.hasService(name: name)){
            fatalError("Nincs ilyen service regisztralva: \(name)")
            
        }
        return CoreService(name: name, reference: self.mapping[name]!).addParam(name: CoreService.CORE_SERVICE_NAME, value: name)
    }
    
    public func hasService(name:String)->Bool{
       return self.mapping.keys.contains(name)
    }

}
