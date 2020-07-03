//
//  CompactViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/03.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class CompactViewController: UIViewController {

    @IBOutlet weak var isFeverField: UISwitch!
    @IBOutlet weak var isBudouenField: UISwitch!
    @IBOutlet weak var numBenBeforeField: UITextField!
    @IBOutlet weak var numHeightField: UITextField!
    @IBOutlet weak var numWeightField: UITextField!
    @IBOutlet weak var numBenNowField: UITextField!
    @IBOutlet weak var intBenStatusField: UISegmentedControl!
    @IBOutlet weak var intBlodBenField: UISegmentedControl!
    @IBOutlet weak var intStomachAcheField: UISegmentedControl!
    
    
    
    // back to Compact View
    @IBAction func comeHome (segue: UIStoryboardSegue) {
        // then setting in Story Board
        // segue have to call the home func
        // call the func in new view would not work
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
