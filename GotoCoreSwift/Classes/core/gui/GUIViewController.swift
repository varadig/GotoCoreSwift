//
//  GUIViewController.swift
//  GotoCoreSwift
//
//  Created by Gábor Váradi on 2018. 01. 02..
//  Copyright © 2018. Varadi Gabor. All rights reserved.
//

import UIKit

open class GUIViewController: UIViewController,ICoreClass {
    public private(set) var name:String = NSUUID().uuidString;
    
    public var sc:CoreServiceContainer
    public var callbacks:[IExecutable]
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.sc = CoreServiceContainer.getInstance()
        self.callbacks = [IExecutable]()
        super.init(coder:aDecoder)
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
