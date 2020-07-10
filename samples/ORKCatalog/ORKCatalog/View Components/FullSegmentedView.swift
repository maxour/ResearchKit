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
 
/*
    public let valueSegmentedControl: UISegmentedControl = {
        let segmentdControl = UISegmentedControl()
        segmentdControl.translatesAutoresizingMaskIntoConstraints = false
        segmentdControl.setTitle("選択肢1", forSegmentAt: 0)
        segmentdControl.setTitle("選択肢2", forSegmentAt: 1)
        return segmentdControl
    }()
    
    private let contentStackView: UIStackView
    private let contentSpacing: CGFloat = 10.0
*/
 
    private override init(frame: CGRect) {
//        contentStackView = UIStackView(arrangedSubviews: [nameLabel, valueSegmentedControl])
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
//        contentStackView = UIStackView(arrangedSubviews: [nameLabel, valueSegmentedControl])
//        contentStackView.axis = .vertical
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
//        contentStackView.spacing = contentSpacing
//        contentStackView.axis = .vertical
//        self.addSubview(contentStackView)
        self.addSubview(nameLabel)
        setUpConstraints()
    }
    
    internal func setUpConstraints() {
        let constraintY = NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let constraintX = NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let constraintWidth = NSLayoutConstraint(item: nameLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 4/5, constant: 0)
        let constraintHeight = NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1/2, constant: 0)
        self.addConstraints([constraintY, constraintX, constraintWidth, constraintHeight])
    }
}
