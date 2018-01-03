//
//  ICoreClass.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 18/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

public protocol ICoreClass {
    var name:String{get}
    var sc:CoreServiceContainer{get set}
    var callbacks:[IExecutable]{get set}
    func log(message:String)->Void
    func serviceAddCallback(params:Dictionary<String,Any>) -> Void
    func serviceRemoveCallback(params:Dictionary<String,Any>) -> Void
}
