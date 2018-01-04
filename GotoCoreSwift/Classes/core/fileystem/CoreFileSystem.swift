//
//  CoreFileSystem.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

open class CoreFileSystem: CoreBaseClass {
    
    /*PROPERTIES*/
    public static let PATH:String = "core.filesystem.path";
    public static let FROM:String = "core.filesystem.from";
    public static let TO:String = "core.filesystem.to";
    public static let CONTENT:String = "core.filesystem.content";
    public static let FILE:String = "core.filesystem.file";
    
    
    /*SERVICES*/
    public static let GET_SUB_FOLDERS:String = "core.filesystem.get.sub.folders";
    public static let GET_FILES:String = "core.filesystem.get.files";
    public static let FILE_EXISTS:String = "core.filesystem.file.exists";
    public static let FOLDER_EXISTS:String = "core.filesystem.folder.exists";
    public static let CREATE_FOLDER:String = "core.filesystem.create.folder";
    public static let COPY_FILE:String = "core.filesystem.copy.file";
    public static let COPY_FOLDER:String = "core.filesystem.copy.folder";
    public static let CREATE_FILE:String = "core.filesystem.create.file";
    public static let APPEND_TEXT_FILE:String = "core.filesystem.append.text.file";
    public static let APPEND_BINARY_FILE:String = "core.filesystem.append.binary.file";
    public static let READ_TEXT:String = "core.filesystem.read.text";
    public static let READ_BYTES:String = "core.filesystem.read.bytes";
    public static let DELETE_FILE:String = "core.filesystem.delete.file";
    public static let DELETE_FOLDER:String = "core.filesystem.delete.folder";
    
    
    public static var instance:CoreFileSystem?
    private var filesystem:IFileSystem
    
    public static func getInstance(filesystem:IFileSystem)->CoreFileSystem{
        if CoreFileSystem.instance == nil{
            CoreFileSystem.instance = CoreFileSystem(filesystem:filesystem)
        }
        return instance!
    }
    
    public init(filesystem:IFileSystem){
        self.filesystem = filesystem
        
        super.init()
        
        self.sc.registerService(name: CoreFileSystem.GET_SUB_FOLDERS, reference: self.serviceGetSubFolders);
        self.sc.registerService(name: CoreFileSystem.GET_FILES, reference:  self.serviceGetFiles);
        self.sc.registerService(name: CoreFileSystem.FILE_EXISTS,reference:  self.serviceFileExists);
        self.sc.registerService(name: CoreFileSystem.FOLDER_EXISTS,reference:  self.serviceFolderExists);
        self.sc.registerService(name: CoreFileSystem.CREATE_FOLDER,reference:  self.serviceCreateFolder);
        self.sc.registerService(name: CoreFileSystem.COPY_FILE,reference:  self.serviceCopyFile);
        self.sc.registerService(name: CoreFileSystem.COPY_FOLDER,reference:  self.serviceCopyFolder);
        self.sc.registerService(name: CoreFileSystem.CREATE_FILE,reference:  self.serviceCreateFile);
        self.sc.registerService(name: CoreFileSystem.APPEND_TEXT_FILE,reference:  self.serviceAppendTextFile);
        self.sc.registerService(name: CoreFileSystem.APPEND_BINARY_FILE,reference:  self.serviceAppendBinaryFile);
        self.sc.registerService(name: CoreFileSystem.READ_TEXT,reference:  self.serviceReadText);
        self.sc.registerService(name: CoreFileSystem.READ_BYTES,reference:  self.serviceReadBytes);
        self.sc.registerService(name: CoreFileSystem.DELETE_FILE,reference:  self.serviceDeleteFile);
        self.sc.registerService(name: CoreFileSystem.DELETE_FOLDER,reference:  self.serviceDeleteFolder);
    }
    
    private func serviceGetSubFolders(params:[String:Any])->[String]{
        return self.filesystem.getSubFolders(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceGetFiles(params:[String:Any])->[String]{
        return self.filesystem.getFiles(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceFileExists(params:[String:Any])->Bool{
        return self.filesystem.fileExists(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceFolderExists(params:[String:Any])->Bool{
        return self.filesystem.folderExists(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceCreateFolder(params:[String:Any])->Void{
        self.filesystem.createFolder(path: params[CoreFileSystem.PATH] as! String)
        
    }
    
    private func serviceCopyFile(params:[String:Any])->Void{
        self.filesystem.copyFile(from: params[CoreFileSystem.FROM] as! String, to: params[CoreFileSystem.TO] as!String)
    }
    
    private func serviceCopyFolder(params:[String:Any])->Void{
        self.filesystem.copyFolder(from: params[CoreFileSystem.FROM] as! String, to: params[CoreFileSystem.TO] as!String)
    }
    
    private func serviceCreateFile(params:[String:Any])->Void{
        self.filesystem.writeFile(path: params[CoreFileSystem.PATH] as! String, content: params[CoreFileSystem.CONTENT] as! String, appendable: false)
    }
    
    private func serviceAppendTextFile(params:[String:Any])->Void{
        self.filesystem.writeFile(path: params[CoreFileSystem.PATH] as! String, content: params[CoreFileSystem.CONTENT] as! String, appendable: true)
    }
    
    private func serviceAppendBinaryFile(params:[String:Any])->Void{
        self.filesystem.writeFile(path: params[CoreFileSystem.PATH] as! String, content: params[CoreFileSystem.CONTENT] as! String, appendable: true)
    }
    
    private func serviceReadText(params:[String:Any])->String{
        return self.filesystem.readTextFile(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceReadBytes(params:[String:Any])->Any{
        return self.filesystem.readBinaryFile(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceDeleteFile(params:[String:Any])->Void{
        self.filesystem.deleteFile(path: params[CoreFileSystem.PATH] as! String)
    }
    
    private func serviceDeleteFolder(params:[String:Any])->Void{
        self.filesystem.deleteFolder(path: params[CoreFileSystem.PATH] as! String)
    }
}


