//
//  ViewController.swift
//  automessage
//
//  Created by Junian on 1/11/16.
//  Copyright © 2016 Junian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var buttonSave: NSButton!
    @IBOutlet weak var textMessage: NSTextField!
    
    @IBAction func buttonSaveClicked(sender: AnyObject) {
        saveText(textMessage.stringValue);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let path: String = "/Users/Shared/Automessage"
        let fileManager = NSFileManager.defaultManager()
        do
        {
            try fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil)
        }
        catch let error as NSError
        {
            print("Error while creating a folder.")
        }
        
        textMessage.stringValue = readText()
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func saveText(text: String){
        let file = "autoreply.txt" //this is the file. we will write to and read from it
        
        let dir : NSString = "/Users/Shared/Automessage";
        let path = dir.stringByAppendingPathComponent(file);
            
        //writing
        do {
            try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch {/* error handling here */}
    }
    
    func readText()->String{
        let file = "autoreply.txt" //this is the file. we will write to and read from it
        
        let dir : NSString = "/Users/Shared/Automessage";
        let path = dir.stringByAppendingPathComponent(file);
        
        
        //reading
        do {
            let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return text2 as String
        }
        catch {/* error handling here */}
        return ""
    }
}

