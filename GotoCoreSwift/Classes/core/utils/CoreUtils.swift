//
//  CoreUtils.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 04..
//
//

import UIKit
import Foundation

class CoreUtils: CoreBaseClass {
    public static var timeStamp:String {
        get{
            let date = Date()
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            let nanosec = calendar.component(.nanosecond, from: date)
            return "\(year)-\(month)-\(day) \(hour):\(minutes):\(seconds).\(nanosec)"
        }
    }
}
