//
//  IFileSystem.swift
//  Pods
//
//  Created by Gábor Váradi on 2018. 01. 03..
//
//

import UIKit

public protocol IFileSystem {
    func getSubFolders(path:String)->[String]
    func getFiles(path:String)->[String]
    func fileExists(path:String)->Bool
    func folderExists(path:String)->Bool
    func createFolder(path:String)->Void
    func copyFile(from:String, to:String)->Void
    func copyFolder(from:String, to:String)->Void
    func writeFile(path:String, content:String, appendable:Bool)->Void
    func readTextFile(path:String)->String
    func readBinaryFile(path:String)->Any
    func deleteFolder(path:String)->Void
    func deleteFile(path:String)->Void
    func readFile(path:String)->Void
}
