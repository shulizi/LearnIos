//
//  FileViewController.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/23.
//  Copyright © 2018 杜李. All rights reserved.
//

import UIKit
import os.log
class FileViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var textField: UITextField!
    var text: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
       text = textField.text!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        
        textField.resignFirstResponder()
        return true
    }
    @IBAction func save(_ sender: Any) {
         text = textField.text!
        
        let secondQueue = DispatchQueue(label: "queue", qos: .utility, attributes: .concurrent)
        secondQueue.async {
            do {
                let writeData = try NSKeyedArchiver.archivedData(withRootObject: self.text, requiringSecureCoding: false)
                try writeData.write(to: Constants.ArchiveURL)
                os_log("Text successfully saved.", log: OSLog.default, type: .debug)
            } catch {
                os_log("Failed to save text...", log: OSLog.default, type: .error)
            }
        }
        secondQueue.activate()
    }
    @IBAction func read(_ sender: Any) {
        let secondQueue = DispatchQueue(label: "queue", qos: .utility, attributes: .concurrent)
        secondQueue.async {
            do {
                guard let data = try? Data(contentsOf: Constants.ArchiveURL, options: []) else{
                    fatalError("No such file.")
                }
                guard let tempText = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? String else {
                    fatalError("Can't get String")            }
                
                os_log("Text successfully read.", log: OSLog.default, type: .debug)
                self.text = tempText
            } catch {
                fatalError("Error")
            }
        }
        textField.text = text
    }
    


}
