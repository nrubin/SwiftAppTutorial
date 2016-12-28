//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Noam Rubin on 12/15/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    func testMealInitializationSucceeds() {
        let zeroRatingMeal = Meal.init(name: "zeroMeal", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        
        let positiveRatingMeal = Meal.init(name: "zeroMeal", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails() {
        let zeroRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(zeroRatingMeal)
        
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        let positiveRatingMeal = Meal.init(name: "", photo: nil, rating: 5)
        XCTAssertNil(positiveRatingMeal)
    }
}
