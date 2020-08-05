//
//  CompactViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/03.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class CompactViewController: UIViewController {

    @IBOutlet weak var barCodeReaderButton: UIButton!
    @IBOutlet weak var isFeverField: UISwitch!
    @IBOutlet weak var isBudouenField: UISwitch!
    @IBOutlet weak var numBenBeforeField: UITextField!
    @IBOutlet weak var numHeightField: UITextField!
    @IBOutlet weak var numWeightField: UITextField!
    @IBOutlet weak var numBenNowField: UITextField!
    @IBOutlet weak var intBenStatusField: UISegmentedControl!
    @IBOutlet weak var intBlodBenField: UISegmentedControl!
    @IBOutlet weak var intStomachAcheField: UISegmentedControl!
    
    // input less than maxLength
    @IBAction func numBenBeforeEditingChanged(_ sender: Any) {
        let maxLength: Int = 2
        guard let text = numBenBeforeField.text else { return }
        numBenBeforeField.text = String(text.prefix(maxLength))
    }
    
    @IBAction func numHeightEditingChanged(_ sender: Any) {
        let maxLength: Int = 5
        guard let text = numHeightField.text else { return }
        numHeightField.text = String(text.prefix(maxLength))
    }
    
    @IBAction func numWeightEditingChanged(_ sender: Any) {
        let maxLength: Int = 5
        guard let text = numWeightField.text else { return }
        numWeightField.text = String(text.prefix(maxLength))
    }
    
    @IBAction func numBenNowEditingChanged(_ sender: Any) {
        let maxLength: Int = 2
        guard let text = numBenNowField.text else { return }
        numBenNowField.text = String(text.prefix(maxLength))
    }
    
    @IBAction func showBarCodeReader(_ sender: Any) {
        self.present(BarCodeReaderVC(), animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        // save current status before go next
        let defaults = UserDefaults.standard
        var qrData = ""
        
        // 0-3 身長
        let numHeight:Int = Int((Double(numHeightField.text ?? "999.9") ?? 999.9)*10)
        qrData += String(format: "%04d", numHeight).prefix(4)
        
        // 4-7 体重
        let numWeight:Int = Int((Double(numWeightField.text ?? "999.9") ?? 999.9)*10)
        qrData += String(format: "%04d", numWeight).prefix(4)
        
        // 8-9 正常の便回数/日
        let numBenBefore:Int = Int(numBenBeforeField.text ?? "99") ?? 99
        qrData += String(format: "%02d", numBenBefore)
        
        // 10-11 現在の便回数/日
        let numBenNow:Int = Int(numBenNowField.text ?? "99") ?? 99
        qrData += String(format: "%02d", numBenNow)
        
        // 12-15 現在の便性状
        switch intBenStatusField.selectedSegmentIndex {
        case 0:
            qrData += "1000"
        case 1:
            qrData += "0100"
        case 2:
            qrData += "0010"
        case 3:
            qrData += "0001"
        default:
            qrData += "0000"
        }
        
        qrData += "9"   // 16 MAYO:血便 現在の血便の頻度
        qrData += "9"   // 17 MAYO:粘膜所見
        qrData += "9"   // 18 MAYO:医師の全般的 評価
        
        // 19 CAI:血便
        switch intBlodBenField.selectedSegmentIndex {
        case -1:
            qrData += "9"
        default:
            qrData += String(intBlodBenField.selectedSegmentIndex)
        }
        
        // 20 CAI:腹痛/腹痙攣
        switch intStomachAcheField.selectedSegmentIndex {
        case -1:
            qrData += "9"
        default:
            qrData += String(intStomachAcheField.selectedSegmentIndex)
        }
        qrData += String(isFeverField.isOn ? 1 : 0)     // 21 CAI:体温上昇>38°C
        qrData += String(isBudouenField.isOn ? 1 : 0)   // 22 CAI:虹彩炎
        
        qrData += "009" // 23-25
        
        defaults.set(qrData, forKey: "qrData")
    }
    
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
