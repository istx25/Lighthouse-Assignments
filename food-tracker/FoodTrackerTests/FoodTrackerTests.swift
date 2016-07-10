//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Willow Belle on 2015-11-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    func testMealInitialization() {
        // Success case.
        let potentialItem = Meal(name: "Newest Meal", rating: 5, photo: nil)
        XCTAssertNotNil(potentialItem)

        // Failure cases.
        let noName = Meal(name: "", rating: 0, photo: nil)
        XCTAssertNil(noName, "Empty name is invalid")

        let badRating = Meal(name: "Really bad rating", rating: -1, photo: nil)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
    
}
