//
//  CustomizedContentView.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import ResearchKit.Private

internal class CustomizedContentView: UIView {
    
    public var colorLabelText: String?
    public var colorLabelColor: UIColor?
    
    public let redButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("あか", for: .normal)
        return button
    }()
    
    public let greenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("みどり", for: .normal)
        return button
    }()
    
    public let blueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("あお", for: .normal)
        return button
    }()
    
    public let yellowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("きいろ", for: .normal)
        return button
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        let colorLabelFontSize: CGFloat = 60.0
        label.numberOfLines = 1
        label.text = " "
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: colorLabelFontSize)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let buttonStackView: UIStackView
    
    private let minimumButtonHeight: CGFloat = 60.0
    private let buttonStackViewSpacing: CGFloat = 20.0
    
    private override init(frame: CGRect) {
        buttonStackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton, yellowButton])
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        buttonStackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton, yellowButton])
        super.init(coder: aDecoder)
        setup()
    }
    
    internal func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.systemGray2
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.spacing = buttonStackViewSpacing
        buttonStackView.axis = .horizontal
        self.addSubview(colorLabel)
        self.addSubview(buttonStackView)
        setUpConstraints()
    }
    
    internal func setColorLabelText(colorLabelText text: String) {
        colorLabelText = text
        colorLabel.text = text
        setNeedsDisplay()
    }
    
    internal func setColorLabelColor(colorLabelColor color: UIColor) {
        colorLabelColor = color
        colorLabel.textColor = color
        setNeedsDisplay()
    }
    
    internal func getColorLabelText() -> String {
        return colorLabel.text!
    }
    
    internal func getColorLabelColor() -> UIColor {
        return colorLabel.textColor
    }
    
    internal func setUpConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        var views = [String: Any]()
        views["colorLabel"] = colorLabel
        views["buttonStackView"] = buttonStackView
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-(==30)-[colorLabel]-(>=10)-[buttonStackView]-(==30)-|",
                                                          options: .alignAllCenterX,
                                                          metrics: nil,
                                                          views: views)
        
        constraints += [
            NSLayoutConstraint(item: buttonStackView as Any,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: minimumButtonHeight),
            NSLayoutConstraint(item: buttonStackView as Any,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0.0)
        ]
    
        for button in [redButton, greenButton, blueButton, yellowButton] {
            constraints += [
                NSLayoutConstraint(item: button,
                                   attribute: .width,
                                   relatedBy: .equal,
                                   toItem: button,
                                   attribute: .height,
                                   multiplier: 1.0,
                                   constant: 0.0)
            ]
        }
        
        self.addConstraints(constraints)
        NSLayoutConstraint.activate(constraints)
    }
}
