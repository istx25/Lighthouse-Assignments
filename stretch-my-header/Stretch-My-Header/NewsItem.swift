//
//  NewsItem.swift
//  Stretch-My-Header
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

struct NewsItem {

    enum Category: String {
        case World = "World"
        case Americas = "Americas"
        case Europe = "Europe"
        case MiddleEast = "Middle East"
        case Africa = "Africa"
        case AsiaPacific = "Asia Pacific"
    }

    let headline: String
    let category: Category

    init(headline: String, category: Category) {
        self.headline = headline
        self.category = category
    }

}
