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
    
    @IBOutlet weak var pathInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.log(message: "view loaded")
        let content = self.sc.getService(name: CoreFileSystem.READ_TEXT)
            .addParam(name: CoreFileSystem.PATH, value: "/Volumes/Sierra/Users/varadig/Desktop/npm-debug.log")
            .execute()
        
        self.log(message: content as! String)
        
    }
    @IBAction func folderExists(_ sender: Any) {
        
        let exists:Bool = self.sc.getService(name: CoreFileSystem.FOLDER_EXISTS)
        .addParam(name: CoreFileSystem.PATH, value: self.pathInput.text ?? "")
        .execute() as! Bool
        
        self.log(message: "folder exists:"+exists.description ?? "none")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


