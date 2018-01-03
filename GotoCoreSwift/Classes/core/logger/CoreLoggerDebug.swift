//
//  CoreLoggerDebug.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

public class CoreLoggerDebug: CoreBaseClass,ILogger {
    public func addLog(message:String)->Void{
        self.addLogEntry(message:message);
    }
    public  func addLogEntry(message:String)->Void{
        print(message)
    }
    public func createEntryFrom(message:String)->String{
        return ""
    }
    
}
