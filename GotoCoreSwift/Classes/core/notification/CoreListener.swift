//
//  CoreListener.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreListener: CoreFunctionWrapper,IListener {
    private var _id:String?
    public var id:String{
        get{return self._id!}
        set{_id = newValue}
    }
    
    internal static let REGISTER_LISTENER:String = "core.listener.register.listener";
    internal static let REGISTER_LISTENERS:String = "core.listener.register.listeners";
    internal static let REMOVE_LISTENERS_BY_NAME:String = "core.listener.remove.listeners.by.name";
    internal static let REMOVE_LISTENER:String = "core.listener.remove.listener";
    internal static let REMOVE_LISTENERS:String = "core.listener.remove.listeners";
    internal static let REFERENCE:String = "reference";
    internal static let LISTENER:String = "listener";
    internal static let NAME:String = "name";
    internal static let ID:String = "id";
    
    public init(name:String,reference:@escaping Reference,id:String){
        
        super.init(name: name, reference: reference)
        self.id = id
    }
    
    override public func notify() {
        self.call()
    }
    
    public static func register(name:String, callback:@escaping Reference,id:String)->Void{
        let listener:CoreListener = CoreListener(name: name, reference: callback,id:id)
        CoreServiceContainer.getInstance().getService(name: CoreListener.REGISTER_LISTENER)
        .addParam(name: CoreListener.LISTENER, value: listener)
        .addParam(name: CoreListener.NAME, value: name)
        .execute()
    }
    
    public static func unregister(name:String,id:String)->Void{
        CoreServiceContainer.getInstance().getService(name: CoreListener.REMOVE_LISTENER)
        .addParam(name: CoreListener.NAME, value: name)
        .addParam(name: CoreListener.ID, value: id)
        .execute()
    }
}
