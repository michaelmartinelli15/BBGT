//
//  Brofessor_Beef_s_Gainz_TrackerTests.swift
//  Brofessor Beef's Gainz TrackerTests
//
//  Created by Michael Martinelli on 11/12/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import XCTest
@testable import Brofessor_Beef_s_Gainz_Tracker

class Brofessor_Beef_s_Gainz_TrackerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: exercise tests
    
    func testExerciseInitializer() {
        let defaultExercise = Exercise.init(name: "Bench Press", reps: 5, sets: 5, startingWeight: 135, description: "Press the bar away from your chest")
    }

}
