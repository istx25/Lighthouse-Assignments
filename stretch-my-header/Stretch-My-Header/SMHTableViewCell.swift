//
//  SMHTableViewCell.swift
//  Stretch-My-Header
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class SMHTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!

    func configure(item: NewsItem) {
        categoryLabel.text = String(item.category.rawValue)
        headlineLabel.text = item.headline
        categoryLabel.textColor = configureColor(item.category)
    }

    func configureColor(category: NewsItem.Category) -> UIColor {
        switch category {
        case .World:
           return .greenColor()
        case .Americas:
            return .orangeColor()
        case .Europe:
            return .blueColor()
        case .MiddleEast:
            return .purpleColor()
        case .Africa:
            return .redColor()
        case .AsiaPacific:
            return .cyanColor()
        }
    }
}
