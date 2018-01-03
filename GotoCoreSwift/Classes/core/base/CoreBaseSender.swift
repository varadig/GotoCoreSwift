//
//  CoreBaseSender.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreBaseSender: CoreBaseParameterHolder {
    internal var name:String
    internal var collection:[IExecutable]
    public init(name:String,collection:[IExecutable]){
        self.name = name
        self.collection = collection
    }
    

}
