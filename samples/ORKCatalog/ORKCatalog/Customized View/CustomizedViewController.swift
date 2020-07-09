//
//  CustomizedViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/09.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class CustomizedViewController: UIViewController {

    @IBOutlet weak var topFixedStackView: UIStackView!
    @IBOutlet weak var bottomFixedStackView: UIStackView!
    @IBOutlet weak var centerScrollView: UIScrollView!
    @IBOutlet weak var centerStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerStackView.backgroundColor = .none

        // Do any additional setup after loading the view.
        let backgroundColor01 = UIColor.lightGray
        let button01:UIButton = UIButton()
        button01.setTitle("テストボタン", for: .normal)
        button01.backgroundColor = backgroundColor01
        button01.translatesAutoresizingMaskIntoConstraints = false
        centerStackView.addArrangedSubview(button01)
        
        let backgroundColor02 = UIColor.lightGray
        let button02:UIButton = UIButton()
        button02.setTitle("テストボタン", for: .normal)
        button02.backgroundColor = backgroundColor02
        button02.translatesAutoresizingMaskIntoConstraints = false
        centerStackView.addArrangedSubview(button02)
        
        var newSwitch:UISwitch
        for _ in 0...100 {
            newSwitch = UISwitch()
            newSwitch.isOn = true
            centerScrollView.addSubview(newSwitch)
        }
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
