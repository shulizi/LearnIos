//
//  Sender2ViewController.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/23.
//  Copyright © 2018 杜李. All rights reserved.
//

import UIKit
import os.log
class Sender2ViewController: UIViewController {
    var textFieldText: String?
    var buttonText: String?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let textFieldText = textFieldText, let buttonText = buttonText{
            textField.text = textFieldText
            buttonLabel.text = buttonText
        }
    }
    @IBAction func cancel(_ sender: Any) {
        
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode{
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The Sender2ViewController is not inside a navigation controller.")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
       
        textFieldText = textField.text
    }
    


}
