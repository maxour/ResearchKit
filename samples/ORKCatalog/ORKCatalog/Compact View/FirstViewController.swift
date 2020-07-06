//
//  FirstViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/06.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var currentIntTextField: UITextField!
    @IBOutlet weak var currentIntStepper: UIStepper!
    
    var currentIntValue: Int = 5
    
    @IBAction func changeStepperValue(_ sender: UIStepper) {
        let newValue = Int(sender.value)
        currentIntValue = newValue
        currentIntTextField.text = String(newValue)
    }

    @IBAction func changeTextFieldValue(_ sender: UITextField) {
        let newValue = Int(sender.text ?? "0")
        currentIntValue = newValue ?? 0
        currentIntStepper.value = Double(newValue ?? 0)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        currentIntStepper.value = Double(currentIntValue)
        currentIntTextField.text = String(currentIntValue)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
