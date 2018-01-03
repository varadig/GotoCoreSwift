//
//  CoreLogger.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreLogger: CoreBaseClass {
    public static let LOGGER_LOG:String = "logger.log"
    public static let MESSAGE:String = "message"
    public static let POS:String = "pos"
    
    private static var instance:CoreLogger?
    private var loggers:[ILogger]?
    
    public static func getInstance(loggers:[ILogger])->CoreLogger{
        if CoreLogger.instance == nil{
            CoreLogger.instance = CoreLogger(loggers:loggers)
        }
        
        return CoreLogger.instance!
    }
    
    public init(loggers:[ILogger]){
        super.init()
        self.loggers = loggers
        self.sc.registarService(name: CoreLogger.LOGGER_LOG, reference: self.serviceLog)
    }
    
    private func serviceLog(params:[String:Any])->Any?{
        for var logger in self.loggers!{
            logger.addLog(message: params[CoreLogger.MESSAGE] as! String)
        }
        return nil
    }
}
