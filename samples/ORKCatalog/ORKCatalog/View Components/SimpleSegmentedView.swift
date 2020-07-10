//
//  SimpleSegementedView.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/10.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

internal class SimpleSegmentedView: UIStackView {
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "項目名"
        return label
    }()
    
    public let valueSegmentedControl: UISegmentedControl = {
        let segmentdControl = UISegmentedControl()
        segmentdControl.translatesAutoresizingMaskIntoConstraints = false
        segmentdControl.setTitle("選択肢1", forSegmentAt: 0)
        segmentdControl.setTitle("選択肢2", forSegmentAt: 1)
        return segmentdControl
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    internal required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        self.axis = .horizontal
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(nameLabel)
        self.addArrangedSubview(valueSegmentedControl)
        
        // 横方向の中心は、親ビューの横方向の中心と同じ
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        // 縦方向の中心は、親ビューの縦方向の中心と同じ
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        // 幅は、親ビューの幅の1/2
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        // 親ビューの幅の1/2
        nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        // 横方向の中心は、親ビューの横方向の中心と同じ
        valueSegmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        // 縦方向の中心は、親ビューの縦方向の中心と同じ
        valueSegmentedControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        // 幅は、親ビューの幅の1/2
        valueSegmentedControl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        // 親ビューの幅の1/2
        valueSegmentedControl.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
