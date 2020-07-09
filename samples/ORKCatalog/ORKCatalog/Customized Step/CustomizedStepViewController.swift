//
//  CustomizedStepViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import ResearchKit.Private

public class CustomizedStepViewController: ORKStepViewController {
    
    private let customizedContentView = CustomizedContentView()
    private var colors = [String: UIColor]()
    private var differentColorLabels = [String: [UIColor]]()
    private var questionNumber = 0
    
    private let red = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    private let green = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    private let blue = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    private let yellow = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
    
    private let redString = "あか"
    private let greenString = "みどり"
    private let blueString = "あお"
    private let yellowString = "きいろ"
    
    private var nextQuestionTimer: Timer?
    private var results: NSMutableArray?
    private var startTime: TimeInterval?
    private var endTime: TimeInterval?
    
    public override init(step: ORKStep?) {
        super.init(step: step)
        //suspendIfInactive = true
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
        
        colors[redString]    = red
        colors[blueString]   = blue
        colors[yellowString] = yellow
        colors[greenString]  = green

        differentColorLabels[redString]    = [blue, green, yellow]
        differentColorLabels[blueString]   = [red, green, yellow]
        differentColorLabels[yellowString] = [red, blue, green]
        differentColorLabels[greenString]  = [red, blue, yellow]
        
        self.view = customizedContentView
        //view?.inputView = customizedContentView
        //activeStepView?.activeCustomView = stroopContentView
        //activeStepView?.customContentFillsAvailableSpace = true
        
//        customizedContentView.redButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        customizedContentView.greenButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        customizedContentView.blueButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        customizedContentView.yellowButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

/*
    @objc
    private func buttonPressed(sender: Any) {
        
        if customizedContentView.colorLabelText != " " {
            setButtonDisabled()
            if let button = sender as? UIButton {
                
                if button == customizedContentView.redButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: customizedContentView.colorLabelColor!).first as? String ?? "", withText: customizedContentView.colorLabelText!, withColorSelected: redString)
                } else if button == customizedContentView.greenButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: customizedContentView.colorLabelColor!).first as? String ?? "", withText: customizedContentView.colorLabelText!, withColorSelected: greenString)
                } else if button == customizedContentView.blueButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: customizedContentView.colorLabelColor!).first as? String ?? "", withText: customizedContentView.colorLabelText!, withColorSelected: blueString)
                } else if button == customizedContentView.yellowButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: customizedContentView.colorLabelColor!).first as? String ?? "", withText: customizedContentView.colorLabelText!, withColorSelected: yellowString)
                }
            }
        }
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        start()
    }

     public override func stepDidFinish() {
         super.stepDidFinish()
         stroopContentView.finishStep(self)
         goForward()
     }
     
    public override var result: ORKStepResult? {
        let stepResult = super.result
        if results != nil {
            stepResult?.results = results?.copy() as? [ORKResult]
        }
        return stepResult!
    }
    
    private func createResult(color: String, withText text: String, withColorSelected colorSelected: String) {
        let customizedResult = CustomizedResult(identifier: (step!.identifier))
        customizedResult.startTime = startTime
        customizedResult.endTime = ProcessInfo.processInfo.systemUptime
        customizedResult.color = color
        customizedResult.text = text
        customizedResult.colorSelected = colorSelected
        results?.add(customizedResult)
    }

    
    @objc
    private func startNextQuestionOrFinish() {
        if nextQuestionTimer != nil {
            nextQuestionTimer?.invalidate()
            nextQuestionTimer = nil
        }
        questionNumber += 1
        if questionNumber == stroopStep().numberOfAttempts {
            finish()
        } else {
            startQuestion()
        }
    }
    
    private func startQuestion() {
        let pattern: Int = Int(arc4random()) % 2
        if pattern == 0 {
            let index: Int = Int(arc4random()) % differentColorLabels.keys.count
            let text = Array(differentColorLabels.keys)[index]
            stroopContentView.setColorLabelText(colorLabelText: text)
            let color = colors[text]!
            stroopContentView.colorLabelColor = color
            stroopContentView.setColorLabelColor(colorLabelColor: color)
        } else {
            let index: Int = Int(arc4random()) % differentColorLabels.keys.count
            let text = Array(differentColorLabels.keys)[index]
            stroopContentView.setColorLabelText(colorLabelText: text)
            let colorArray = differentColorLabels[text]!
            let randomColorIndex = Int(arc4random()) % colorArray.count
            let color = colorArray[randomColorIndex]
            stroopContentView.setColorLabelColor(colorLabelColor: color)
        }
        
        setButtonsEnabled()
        startTime = ProcessInfo.processInfo.systemUptime
    }
    
     
    private func setButtonDisabled() {
        
        customizedContentView.redButton.isEnabled = false
        customizedContentView.greenButton.isEnabled = false
        customizedContentView.blueButton.isEnabled = false
        customizedContentView.yellowButton.isEnabled = false
    }
    
    private func setButtonsEnabled() {
        
        customizedContentView.redButton.isEnabled = true
        customizedContentView.greenButton.isEnabled = true
        customizedContentView.blueButton.isEnabled = true
        customizedContentView.yellowButton.isEnabled = true
    }
*/

}
