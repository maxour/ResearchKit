//
//  CustomizedStepViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import ResearchKit.Private

public class CustomizedStepViewController: ORKStepViewController {  // ORKCustomStepViewController not work
    
    private let customizedContentView = CustomizedContentView()
    private var results: NSMutableArray?

    
    public override init(step: ORKStep?) {
        super.init(step: step)
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizedStep() -> CustomizedStep {
        return step as! CustomizedStep
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        results = NSMutableArray()
        
        view.addSubview(customizedContentView)  // add subView here
    }
}
