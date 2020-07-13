//
//  SecondViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/06.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var centerStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var newView: UIView
        for row in 0...60 {
            if (row % 2 == 0) {
                newView = SimpleSegmentedView()
                centerStackView.addArrangedSubview(newView)
            } else {
                newView = FullSegmentedView()
                centerStackView.addArrangedSubview(newView)
            }
            
        }
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
