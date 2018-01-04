//
//  CoreLoggerFile.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 04..
//
//

import UIKit

open class CoreLoggerFile: CoreBaseLogger{
    
    private var path:String;
    
    public init(path:String){
        self.path = path
    }
    
    override public  func addLogEntry(message:String)->Void{
        self.sc.getService(name: CoreFileSystem.APPEND_TEXT_FILE)
            .addParam(name: CoreFileSystem.PATH, value: self.path)
            .addParam(name: CoreFileSystem.CONTENT, value: self.createEntryFrom(message: message))
            .execute()
        
    }
}
