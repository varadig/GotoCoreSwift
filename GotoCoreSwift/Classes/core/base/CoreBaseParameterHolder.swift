//
//  CoreBaseParameterHolder.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreBaseParameterHolder:NSObject, IExecutable {
    public func setParams(params: [String : Any]) -> IExecutable {
        for key in params.keys{
            self.params[key] = params[key]
        }
        return self
    }

    public func has(reference: (Dictionary<String, Any>) -> Any?) -> Bool {
        return false
    }


    
    public var params:Dictionary<String,Any>=[String:Any]()
    
    public override init(){
    super.init()
    }
    
    public func addParam(name:String,value:Any)->IExecutable{
        if(self.params[name] == nil){
            self.params[name] = value
        }
        return self
    }
    
    public func addParams(params:Dictionary<String,Any>)->IExecutable{
        for key in params.keys{
            self.params[key] = params[key]
        }
        return self
    }
    public func setParam(name:String,value:Any)->IExecutable{
        
        self.params[name] = value
        return self
    }
    public func notify()->Void{}
    public func execute()->Any?{ return nil}
    public func send()->Void{}

}
