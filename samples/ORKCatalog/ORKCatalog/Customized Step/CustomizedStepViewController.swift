//
//  CustomizedStepViewController.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import ResearchKit.Private

public class CustomizedStepViewController: ORKActiveStepViewController {
    
    private let stroopContentView = CustomizedContentView()
    private var colors = [String: UIColor]()
    private var differentColorLabels = [String: [UIColor]]()
    private var questionNumber = 0
    
    private let red = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    private let green = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    private let blue = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    private let yellow = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
    
    private let redString = ORKSwiftLocalizedString("STROOP_COLOR_RED", "")
    private let greenString = ORKSwiftLocalizedString("STROOP_COLOR_GREEN", "")
    private let blueString = ORKSwiftLocalizedString("STROOP_COLOR_BLUE", "")
    private let yellowString = ORKSwiftLocalizedString("STROOP_COLOR_YELLOW", "")
    
    private var nextQuestionTimer: Timer?
    private var results: NSMutableArray?
    private var startTime: TimeInterval?
    private var endTime: TimeInterval?
    
    public override init(step: ORKStep?) {
        super.init(step: step)
        suspendIfInactive = true
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func stroopStep() -> CustomizedStep {
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

        activeStepView?.activeCustomView = stroopContentView
        activeStepView?.customContentFillsAvailableSpace = true
        
        stroopContentView.redButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stroopContentView.greenButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stroopContentView.blueButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        stroopContentView.yellowButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttonPressed(sender: Any) {
        
        if stroopContentView.colorLabelText != " " {
            setButtonDisabled()
            if let button = sender as? ORKBorderedButton {
                
                if button == stroopContentView.redButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: stroopContentView.colorLabelColor!).first as? String ?? "", withText: stroopContentView.colorLabelText!, withColorSelected: redString)
                } else if button == stroopContentView.greenButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: stroopContentView.colorLabelColor!).first as? String ?? "", withText: stroopContentView.colorLabelText!, withColorSelected: greenString)
                } else if button == stroopContentView.blueButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: stroopContentView.colorLabelColor!).first as? String ?? "", withText: stroopContentView.colorLabelText!, withColorSelected: blueString)
                } else if button == stroopContentView.yellowButton {
                    createResult(color: (colors as NSDictionary).allKeys(for: stroopContentView.colorLabelColor!).first as? String ?? "", withText: stroopContentView.colorLabelText!, withColorSelected: yellowString)
                }
                
                nextQuestionTimer = Timer.scheduledTimer(timeInterval: 0.5,
                                                         target: self,
                                                         selector: #selector(startNextQuestionOrFinish),
                                                         userInfo: nil,
                                                         repeats: false)
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

    public override func start() {
        super.start()
        startQuestion()
    }
    
    private func createResult(color: String, withText text: String, withColorSelected colorSelected: String) {
        let stroopResult = CustomizedResult(identifier: (step!.identifier))
        stroopResult.startTime = startTime
        stroopResult.endTime = ProcessInfo.processInfo.systemUptime
        stroopResult.color = color
        stroopResult.text = text
        stroopResult.colorSelected = colorSelected
        results?.add(stroopResult)
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
        
        stroopContentView.redButton.isEnabled = false
        stroopContentView.greenButton.isEnabled = false
        stroopContentView.blueButton.isEnabled = false
        stroopContentView.yellowButton.isEnabled = false
    }
    
    private func setButtonsEnabled() {
        
        stroopContentView.redButton.isEnabled = true
        stroopContentView.greenButton.isEnabled = true
        stroopContentView.blueButton.isEnabled = true
        stroopContentView.yellowButton.isEnabled = true
    }
}
