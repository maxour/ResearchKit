//
//  UnitTextFieldView.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/13.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class UnitTextFieldView: UIView {
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        
        // MUST set File’s Owner class to be UnitTextFieldView
        // if set the view class to be UnitTextFieldView, it would crash!!!
        
        let view = Bundle.main.loadNibNamed("UnitTextFieldView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
