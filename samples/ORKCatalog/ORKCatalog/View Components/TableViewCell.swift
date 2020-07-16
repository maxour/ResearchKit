//
//  TableViewCell.swift
//  ORKCatalog
//
//  Created by 宋チュウ on 2020/07/15.
//  Copyright © 2020 researchkit.org. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    struct Item {
        let title: String?
        let date: String?
        let description: String?
        let imageUrl: URL?
    }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.frame.size.height = 200
        
        let simpleView = SimpleSegmentedView()
        contentView.addSubview(simpleView)
        
        setUpConstraints(simpleView)
    }
    
    internal func setUpConstraints(_ view: UIView) {
        let constraintY = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let constraintX = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let constraintWidth = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let constraintHeight = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraints([constraintY, constraintX, constraintWidth, constraintHeight])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // TODO
    }
    
    func configure(with item: Item) {
        // TODO
    }
}

final class VerticalTableViewCell: TableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let fullView = FullSegmentedView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(fullView)
        
        setUpConstraints(fullView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class HorizontalTableViewCell: TableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let horizontalStackView = SimpleSegmentedView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(horizontalStackView)

        setUpConstraints(horizontalStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // TODO
    }
}
