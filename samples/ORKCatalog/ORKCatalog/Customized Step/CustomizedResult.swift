//
//  CustomizedResult.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/08.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import ResearchKit.Private

public class CustomizedResult: ORKResult {
    
    public var startTime: TimeInterval?
    public var endTime: TimeInterval?
    public var color: String?
    public var text: String?
    public var colorSelected: String?
    
    enum Keys: String {
        case startTime
        case endTime
        case color
        case text
        case colorSelected
    }
    
    public override init(identifier: String) {
        super.init(identifier: identifier)
    }
    
    public override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(startTime, forKey: Keys.startTime.rawValue)
        aCoder.encode(endTime, forKey: Keys.endTime.rawValue)
        aCoder.encode(color, forKey: Keys.color.rawValue)
        aCoder.encode(text, forKey: Keys.text.rawValue)
        aCoder.encode(colorSelected, forKey: Keys.colorSelected.rawValue)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        startTime = aDecoder.decodeObject(forKey: Keys.startTime.rawValue) as? Double
        endTime = aDecoder.decodeObject(forKey: Keys.endTime.rawValue) as? Double
        color = aDecoder.decodeObject(forKey: Keys.color.rawValue) as? String
        text = aDecoder.decodeObject(forKey: Keys.text.rawValue) as? String
        colorSelected = aDecoder.decodeObject(forKey: Keys.colorSelected.rawValue) as? String
    }
    
    public class func supportsSecureCoding() -> Bool {
        return true
    }
    
    override public func isEqual(_ object: Any?) -> Bool {
        let isParentSame = super.isEqual(object)
        
        if let castObject = object as? CustomizedResult {
            return (isParentSame &&
                   (startTime == castObject.startTime) &&
                   (endTime == castObject.endTime) &&
                   (color == castObject.color) &&
                   (text == castObject.text) &&
                   (colorSelected == castObject.colorSelected))
        }
        return true
    }
    
    override public func copy(with zone: NSZone? = nil) -> Any {
        if let result = super.copy(with: zone) as? CustomizedResult {
            result.startTime = startTime
            result.endTime = endTime
            result.color = color
            result.text = text
            result.colorSelected = colorSelected
            return result
        } else {
            return super.copy(with: zone)
        }
    }
    
    public override func description(withNumberOfPaddingSpaces numberOfPaddingSpaces: UInt) -> String {
        return "\(descriptionPrefix(withNumberOfPaddingSpaces: numberOfPaddingSpaces)); color: \(color ?? "") text: \(text ?? "") colorSelected: \(colorSelected ?? "") \(descriptionSuffix())"
    }
}
