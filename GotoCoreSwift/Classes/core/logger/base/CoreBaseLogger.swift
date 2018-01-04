//
//  CoreBaseLogger.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 04..
//
//

import UIKit


open class CoreBaseLogger: CoreBaseClass,ILogger {
    private let br:String = "\n";

    public func addLog(message:String)->Void{
        self.addLogEntry(message:message);
    }
    public  func addLogEntry(message:String)->Void{
    }
    public func createEntryFrom(message:String)->String{
        return CoreUtils.timeStamp + " ----> " + message + self.br
    }
}
