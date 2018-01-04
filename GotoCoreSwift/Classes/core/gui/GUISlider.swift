//
//  GUISlider.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 04..
//
//

import UIKit

open class GUISlider: UISlider,ICoreClass {
    public private(set) var name:String = NSUUID().uuidString;
    public private(set) var context:CoreContext
    public private(set) var sc: CoreServiceContainer
    public private(set) var callbacks: [IExecutable]
    
    public required init?(coder aDecoder: NSCoder) {
        self.sc = CoreServiceContainer.getInstance()
        self.callbacks = [IExecutable]()
        self.context = CoreContext.getInstance()
        super.init(coder:aDecoder)
    }
    public func serviceAddCallback(params: Dictionary<String, Any>) {
        CoreBaseClassFactory.serviceAddCallback(instance: self, params: params)
    }
    public func serviceRemoveCallback(params: Dictionary<String, Any>) {
        CoreBaseClassFactory.serviceRemoveCallback(instance: self, params: params)
    }
    public func log(message: String) {
        CoreBaseClassFactory.log(instance: self, message: message)
    }
}
