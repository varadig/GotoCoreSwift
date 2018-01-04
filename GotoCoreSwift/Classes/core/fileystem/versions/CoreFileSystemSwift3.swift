//
//  CoreFileSystemSwift3.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

open class CoreFileSystemSwift3: CoreBaseClass,IFileSystem {
    public func getSubFolders(path:String)->[String]{
        return [String]()
    }
    
    public func getFiles(path:String)->[String]{
        return [String]()
    }
    
    public func fileExists(path:String)->Bool{
        return FileManager.default.fileExists(atPath: path)
    }
    
    public func folderExists(path:String)->Bool{
        var isDirectory = ObjCBool(true)
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    public func createFolder(path:String)->Void{}
    
    public func copyFile(from:String, to:String)->Void{}
    
    public func copyFolder(from:String, to:String)->Void{}
    
    public func writeFile(path:String, content:String, appendable:Bool)->Void{}
    
    public func readTextFile(path:String)->String{
        do {
            return try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
        }
        catch let error as NSError {
            return "Ooops! Something went wrong: \(error)"
        }
        return ""
    }
    
    public func readBinaryFile(path:String)->Any{        return false
    }
    
    public func deleteFolder(path:String)->Void{}
    
    public func deleteFile(path:String)->Void{}
    
    public func readFile(path:String)->Void{}
}
