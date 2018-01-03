//
//  CoreCallback.swift
//  GotoCoreSwift
//
//  Created by Gábor Váradi on 2018. 01. 03..
//  Copyright © 2018. Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreCallback: CoreBaseSender {
    
    public static let GROUP:String = "core.callback.group"
    public static let CALLBACK:String = "core.callback.callback"
    public static let CALLBACKS:String = "core.callback.callbacks"
    public static let ADD_CALLBACK:String = ".add.callback";
    public static let ADD_CALLBACKS:String = ".add.callbacks";
    
    public static let REMOVE_CALLBACKS:String = ".remove.callbacks";
    public static let REMOVE_CALLBACK:String = ".remove.callback";
    
    public override func send() {
        for service:IExecutable in self.collection {
            service.setParams(params: self.params).execute();
        }
    }
    
    public static func addCallback(target:ICoreClass, group:String, callback:IExecutable)->Void {
        CoreServiceContainer.getInstance().getService(name: target.name + ADD_CALLBACK)
            .addParam(name: GROUP, value: group)
            .addParam(name: CALLBACK, value: callback)
            .execute();
    }
}
