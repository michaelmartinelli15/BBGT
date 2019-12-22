//
//  Workout.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/7/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

// workout data structure

class Workout {
    
    //MARK: Properties
    
    var exercises = [Exercise]()
    var name: String
    
    //MARK: Initialization
    
    init?(exercises: [Exercise], name: String) {
        if exercises.count <= 0 {
            return nil
        }
        
        if !name.isEmpty {
            self.name = name
        }
        
        else {
            self.name = "Default Workout"
        }
        
        for exercise in exercises {
            self.exercises.append(exercise)
            //os_log("Successfully appended %s to exercises", dso: OSLog.default, log: exercise.name, type: .debug)
        }
    }
    
    //MARK: NSCoding Functions
    /*
    func encode(with coder: NSCoder) {
        <#code#>
    }
    
    required init?(coder: NSCoder) {
        <#code#>
    }
 */

}
