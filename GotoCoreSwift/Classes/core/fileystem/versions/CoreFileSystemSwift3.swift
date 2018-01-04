//
//  CoreFileSystemSwift3.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

open class CoreFileSystemSwift3: CoreBaseClass,IFileSystem {
    
    private let fileManager = FileManager.default
    
    public func getSubFolders(path:String)->[String]{
        return [String]()
    }
    
    public func getFiles(path:String)->[String]{
        do{
            var fileURLs =  try self.fileManager.contentsOfDirectory(atPath: path)
            return fileURLs
        } catch let error{
            log(message: "Error: \(error.localizedDescription)")
        }
        return [String]()
    }
    
    public func fileExists(path:String)->Bool{
        return self.fileManager.fileExists(atPath: path)
    }
    
    public func folderExists(path:String)->Bool{
        var isDirectory = ObjCBool(true)
        let exists = self.fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    public func createFolder(path:String)->Void{
        do {
            try self.fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            
        } catch let error {
            log(message: "Error: \(error.localizedDescription)")
        }
    }
    
    public func copyFile(from:String, to:String)->Void{
        self.copyItem(from:from,to:to)
    }
    
    public func copyFolder(from:String, to:String)->Void{
        self.copyItem(from:from,to:to)
    }
    
    private func copyItem(from:String,to:String) -> Void {
        do{
            try self.fileManager.copyItem(atPath: from, toPath: to)
        }catch let error{
            log(message: "Error: \(error.localizedDescription)")
        }
    }
    
    public func writeFile(path:String, content:String, appendable:Bool)->Void{
        if(appendable){
            self.appendFile(path: path, content: content)
        }
        else{
            do{
                try content.write(toFile: path, atomically: false, encoding: .utf8)
            }catch let error{
                log(message: "Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func appendFile(path:String, content:String)->Void{
        if self.fileExists(path: path){
            if let fileHandle = FileHandle(forWritingAtPath: path){
                fileHandle.seekToEndOfFile()
                fileHandle.write(content.data(using: .utf8)!)
                fileHandle.closeFile()
            }
        }
        else{
            self.writeFile(path: path, content: content, appendable: false)
        }
    }
    
    public func readTextFile(path:String)->String{
        do {
            return try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
        }
        catch let error as NSError {
            log(message: "Error: \(error.localizedDescription)")
        }
        return ""
    }
    
    public func readBinaryFile(path:String)->Any{
        return false
    }
    
    public func deleteFolder(path:String)->Void{
        self.delete(path: path)
    }
    
    public func deleteFile(path:String)->Void{
        self.delete(path: path)
    }
    
    private func delete(path:String)->Void{
        do{
            try self.fileManager.removeItem(atPath: path)
        } catch let error{
            log(message: "Error: \(error.localizedDescription)")
        }
    }
}
