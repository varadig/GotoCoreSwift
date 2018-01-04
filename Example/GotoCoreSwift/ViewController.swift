//
//  ViewController.swift
//  GotoCoreSwift
//
//  Created by varadig on 01/03/2018.
//  Copyright (c) 2018 varadig. All rights reserved.
//

import UIKit
import GotoCoreSwift

class ViewController: GUIViewController {
    
    @IBOutlet weak var path: GUITextField!
    @IBOutlet weak var createFolderPath: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.log(message: "view loaded, and the context foo is \(self.context.getString(name: "foo"))")
    }
    
    
    @IBAction func folderExists(_ sender: Any) {
        
        let exists:Bool = self.sc.getService(name: CoreFileSystem.FOLDER_EXISTS)
            .addParam(name: CoreFileSystem.PATH, value: self.path.text ?? "")
            .execute() as! Bool
        
        self.log(message: "folder exists:"+exists.description ?? "none")
        self.sc.getService(name: AlertController.SHOW_ALERT)
            .addParam(name: AlertController.TITLE, value: "LOG")
            .addParam(name: AlertController.VC, value: self)
            .addParam(name: AlertController.MESSAGE, value: exists.description ?? "none")
            .execute()
    }
    
    @IBAction func createFolderButtonHandler(_ sender: Any) {
        self.sc.getService(name: CoreFileSystem.CREATE_FOLDER)
            .addParam(name: CoreFileSystem.PATH, value: self.createFolderPath.text ?? "")
            .execute()
    }
    
    @IBAction func readFilesButtonHandler(_ sender: Any) {
        let content = self.sc.getService(name: CoreFileSystem.GET_FILES)
            .addParam(name: CoreFileSystem.PATH, value: "/Users/varadig/")
            .execute() as! [String]
        
        self.log(message: String(describing: content))
        
        self.sc.getService(name: AlertController.SHOW_ALERT)
            .addParam(name: AlertController.TITLE, value: "LOG")
            .addParam(name: AlertController.VC, value: self)
            .addParam(name: AlertController.MESSAGE, value: String(describing: content))
            .execute()
    }
}


