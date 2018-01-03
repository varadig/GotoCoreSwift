//
//  IExecutable.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 11/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

public protocol IExecutable {
    func addParam(name:String,value:Any)->IExecutable
    func addParams(params:[String:Any])->IExecutable
    func setParam(name:String,value:Any)->IExecutable
    func setParams(params:[String:Any])->IExecutable
    func execute()->Any?
    func notify()->Void

    func has(reference:CoreFunctionWrapper.Reference)->Bool
    func send()->Void
}
