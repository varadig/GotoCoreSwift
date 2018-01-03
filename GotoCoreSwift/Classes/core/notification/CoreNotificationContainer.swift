//
//  CoreNotificationContainer.swift
//  GotoCoreSwift
//
//  Created by Varadi Gabor on 12/12/17.
//  Copyright © 2017 Varadi Gabor. All rights reserved.
//

import UIKit

open class CoreNotificationContainer: CoreBaseClass {
    
    private var mapping:[String:[IListener]]=[String:[IListener]]()
    
    public static var instance:CoreNotificationContainer?
    public static func getInstance()->CoreNotificationContainer{
        if CoreNotificationContainer.instance == nil{
            CoreNotificationContainer.instance = CoreNotificationContainer()
            
        }
        return instance!
    }
    
    override public init(){
        super.init()
        self.sc.registarService(name: CoreListener.REGISTER_LISTENER, reference: self.registerListener)
        self.sc.registarService(name: CoreListener.REMOVE_LISTENER, reference: self.removeListener)
        self.sc.registarService(name: CoreNotification.CREATE_NOTIFICATION, reference: self.createNotification)
    }
    
    private func registerListener(params:Dictionary<String,Any>)->Any?{
        let name:String = params[CoreListener.NAME] as! String
        let listener:CoreListener = params[CoreListener.LISTENER] as! CoreListener
        
        if !self.hasListener(name:name){
            self.mapping[name] = [IListener]()
        }
        
        var collection:[IListener] = self.getListenersOf(name: name)
        collection.append(listener as! IListener)
        self.mapping[name] = collection
        return nil
    }
    
    private func removeListener(params:[String:Any])->Any?{
        let name:String = params[CoreListener.NAME] as! String
        let id:String = params[CoreListener.ID] as! String
        var listeners:[IListener] = self.getListenersOf(name: name)
        let index:Int = self.getListenersBy(id: id, listeners: listeners)
        if index != -1{
            listeners.remove(at: index)
        }
        self.mapping[name] = listeners
        return nil
    }
    
    private func createNotification(params:[String:Any])->Any?{
        var name:String = params[CoreNotification.NAME] as! String
        return CoreNotification(name: name, collection: self.getListenersOf(name: name))
    }
    
    private func getListenersBy(id:String,listeners:[IListener])->Int{
        for i in 0..<listeners.count{
            if listeners[i].id == id{
                return i
            }
        }
        return -1
    }

    private func getListenersOf(name:String)->[IListener]{
        if self.hasListener(name: name){
            return self.mapping[name]!
        }
        else{
            return [IListener]()
        }
    }
    
    private func hasListener(name:String)->Bool{
        return self.mapping.keys.contains(name)
    }

}
