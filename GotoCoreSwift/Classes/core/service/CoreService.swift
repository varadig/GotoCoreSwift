//
//  CoreService.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

class CoreService: CoreFunctionWrapper {
    /*PROPERTIES*/
    public static let CORE_SERVICE_NAME:String = "core.service.name";
    
    
    override public init(name:String,reference:@escaping CoreFunctionWrapper.Reference){
        super.init(name:name, reference:reference)
    }
    
    override public func execute() -> Any? {
        return self.call()
    }
    
    override public func clone() -> Any? {
        let service:CoreService = CoreService(name: self.name,reference: self.reference)
        service.addParams(params: self.params)
        return service
    }
}
