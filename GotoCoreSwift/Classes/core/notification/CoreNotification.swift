//
//  CoreNotification.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreNotification: CoreBaseSender {
    public static let CREATE_NOTIFICATION:String = "create.notification"
    public static let NAME:String = "name"
    public static let BASE_NAME:String = "base.name"
    
    public init(name:String,collection:[IListener]){
        super.init(name:name,collection:collection)
        
    }
    
    public static func createNotification(name:String)->CoreNotification{
        let notification:CoreNotification = CoreServiceContainer.getInstance().getService(name: CoreNotification.CREATE_NOTIFICATION)
        .addParam(name: CoreNotification.NAME, value: name)
        .execute() as! CoreNotification
        
        return notification
    }
    
    override public func send() {
        for var listener in self.collection{
            listener.setParams(params: self.params).addParam(name: CoreNotification.BASE_NAME, value: self.name).notify()
        }
    }
    
    private func debug(file: String = #file, line: Int = #line, function: String = #function) -> String {
        return "\(file):\(line) : \(function)"
    }
}
