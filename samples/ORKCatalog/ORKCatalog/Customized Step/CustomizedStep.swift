//
//  CustomizedStep.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import Foundation
import ResearchKit.Private

public class CustomizedStep: ORKCustomStep {

    public var numberOfAttempts = 0
    private let minimumAttempts = 10
    
    enum Key: String {
        case numberOfAttempts
    }

    public override class func stepViewControllerClass() -> AnyClass {
        return CustomizedStepViewController.self
    }
    
    public class func supportsSecureCoding() -> Bool {
        return true
    }
    
    public override init(identifier: String) {
        super.init(identifier: identifier)
        
//        shouldVibrateOnStart = true
//        shouldShowDefaultTimer = false
//        shouldContinueOnFinish = true
//        stepDuration = TimeInterval(NSIntegerMax)
    }
    
    public override func validateParameters() {
        super.validateParameters()
        assert(numberOfAttempts >= minimumAttempts, "number of attempts should be greater or equal to \(minimumAttempts)")
    }
    
//    public override func startsFinished() -> Bool {
//        return false
//    }
    
    
    public override var allowsBackNavigation: Bool {
        return false
    }
    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let stroopStep = super.copy(with: zone)
        return stroopStep
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberOfAttempts = aDecoder.decodeInteger(forKey: Key.numberOfAttempts.rawValue)
    }
    
    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(numberOfAttempts, forKey: Key.numberOfAttempts.rawValue)
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? CustomizedStep {
            return numberOfAttempts == object.numberOfAttempts
        }
        return false
    }
}
