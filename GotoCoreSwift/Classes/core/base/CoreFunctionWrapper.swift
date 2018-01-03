//
//  CoreFunctionWrapper.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreFunctionWrapper: CoreBaseParameterHolder {
    public typealias Reference = (Dictionary<String,Any>)->Any?

    public var name:String
    public var reference:Reference
    public init(name:String,reference: @escaping Reference){
        self.name = name
        self.reference = reference
    }
    
    public func call()->Any?{
        return self.reference(self.params)
    }
    
    override public func has(reference: Reference) -> Bool {
        return false
//        return self.reference == reference
    }
    public func clone()->Any?{
        return nil
    }
    
}
