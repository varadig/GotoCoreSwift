//
//  CoreLoggerDebug.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

open class CoreLoggerDebug: CoreBaseLogger {
    override public  func addLogEntry(message:String)->Void{
        print(self.createEntryFrom(message: message))
    }
    override  public func createEntryFrom(message:String)->String{
        return CoreUtils.timeStamp + " ----> " + message
    }
}
