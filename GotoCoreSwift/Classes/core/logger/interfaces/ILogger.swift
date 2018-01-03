//
//  ILogger.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

public protocol ILogger {
    
    func addLog(message:String)->Void
    func addLogEntry(message:String)->Void
    func createEntryFrom(message:String)->String
    

}
