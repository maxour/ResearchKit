//
//  FullSegmentedView.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/10.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

internal class FullSegmentedView: UIView {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "項目名"
        return label
    }()
 
    public let valueSegmentedControl: UISegmentedControl = {
        let segmentdControl = UISegmentedControl(items: ["選択肢1", "選択肢2"])
        segmentdControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentdControl
    }()
    
    private let contentSpacing: CGFloat = 10.0
 
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        self.addSubview(valueSegmentedControl)
        setUpConstraintsLeft(nameLabel)
        setUpConstraintsRight(valueSegmentedControl)
    }
    
    internal func setUpConstraintsLeft(_ view: UIView) {
        let constraintY = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let constraintX = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let constraintWidth = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1/2, constant: 0)
        let constraintHeight = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraints([constraintY, constraintX, constraintWidth, constraintHeight])
    }
    
    internal func setUpConstraintsRight(_ view: UIView) {
        let constraintY = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let constraintX = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let constraintWidth = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1/2, constant: 0)
        let constraintHeight = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraints([constraintY, constraintX, constraintWidth, constraintHeight])
    }
}
