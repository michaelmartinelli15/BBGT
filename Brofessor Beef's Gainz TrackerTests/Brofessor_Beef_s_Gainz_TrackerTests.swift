//
//  Brofessor_Beef_s_Gainz_TrackerTests.swift
//  Brofessor Beef's Gainz TrackerTests
//
//  Created by Michael Martinelli on 11/12/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import XCTest
import os.log
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
        let noName = Exercise.init(name: "", reps: 5, sets: 5, startingWeight: 135, description: "Lift")
        let invalidReps = Exercise.init(name: "reps", reps: -1, sets: 5, startingWeight: 135, description: "Lift")
        let invalidSets = Exercise.init(name: "sets", reps: 5, sets: -1, startingWeight: 135, description: "Lift")
        let invalidStartingWeight = Exercise.init(name: "weight", reps: 5, sets: 5, startingWeight: -5, description: "lift")
        let noDescription = Exercise.init(name: "description", reps: 5, sets: 5, startingWeight: 135, description: "")
    }
    
    func testWorkoutInitializer() {
        var exercises = [Exercise]()
        
        guard let benchPress = Exercise(name: "Bench Press", reps: 5, sets: 5, startingWeight: 235, description: "Press the bar") else {
            return ()
        }
        guard let squat = Exercise(name: "Squat", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        
        exercises.append(benchPress)
        exercises.append(squat)
        
        for exercise in exercises {
            os_log("Exercise: %s", exercise.name)
        }
        
        let workout = Workout(exercises: exercises, name: "Test Workout")
        
        for exercise in workout!.exercises {
            os_log("%s: %s", workout!.name, exercise.name)
        }
        
    }

}
