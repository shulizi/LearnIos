//
//  Sender1ViewController.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/23.
//  Copyright © 2018 杜李. All rights reserved.
//

import UIKit
import os.log
class Sender1ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier ?? "" {
        case "AddItem":
            os_log("Adding a new page.",log: OSLog.default,type: .debug)
        case "ShowDetail":
            guard let senderDetailViewController = segue.destination as? Sender2ViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedButtonText = sender as? UIButton else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            senderDetailViewController.textFieldText = textField.text
            senderDetailViewController.buttonText = selectedButtonText.titleLabel?.text
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
 
    @IBAction func unwindToSender1List(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? Sender2ViewController{
            textField.text = sourceViewController.textFieldText
            
        }
    }

}
