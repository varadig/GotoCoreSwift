//
//  CoreBaseClassFactory.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

class CoreBaseClassFactory{
    

public static func log(instance:ICoreClass,message:String)->Void{
        if(CoreServiceContainer.getInstance().hasService(name: CoreLogger.LOGGER_LOG))
        {
            CoreServiceContainer.getInstance().getService(name: CoreLogger.LOGGER_LOG)
            .addParam(name: CoreLogger.MESSAGE, value: message)
                .addParam(name: CoreLogger.POS, value: instance)
            .execute()
        }
    }
    
    public static func serviceAddCallback(instance:ICoreClass,params:Dictionary<String,Any>)->Void{
        
    }
    
    public static func serviceRemoveCallback(instance:ICoreClass,params:Dictionary<String,Any>)->Void{
        
    }
    

}
