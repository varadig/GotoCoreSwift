//
//  CoreBaseClass.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreBaseClass:NSObject,ICoreClass {
    private static  let namePrefix:String = "core.base.class"
    
    public private(set) var name:String = NSUUID().uuidString;
    public private(set) var context:CoreContext;
    public private(set) var sc:CoreServiceContainer;
    public private(set) var callbacks:[IExecutable]
    
    override public init(){
        self.sc = CoreServiceContainer.getInstance()
        self.callbacks = [IExecutable]()
        self.context = CoreContext.getInstance()
        super.init()
    }
    
    public func log(message:String)->Void{
        CoreBaseClassFactory.log(instance: self, message: message)
    }
    
    public func serviceAddCallback(params: Dictionary<String, Any>) {
        CoreBaseClassFactory.serviceAddCallback(instance:self,params:params)
    }
    
    public func serviceRemoveCallback(params: Dictionary<String, Any>) {
        CoreBaseClassFactory.serviceRemoveCallback(instance:self,params:params)
    }
}
