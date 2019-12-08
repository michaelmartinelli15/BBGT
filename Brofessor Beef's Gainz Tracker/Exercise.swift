//
//  Exercise.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/7/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit

class Exercise {
    //MARK: Properties
    
    var name: String
    var reps: Int
    var sets: Int
    var startingWeight: Int
    var description: String
    
    //MARK: Initialization
    
    init(name: String, reps: Int, sets: Int, startingWeight: Int, description: String) {
        if name.isEmpty{
            self.name = "default exercise"
        }
        
        else {
            self.name = name
        }
        
        if reps < 1 {
            self.reps = 5
        }
        
        else {
            self.reps = reps
        }
        
        if sets < 1 {
            self.sets = 5
        }
        
        else {
            self.sets = sets
        }
        
        if startingWeight < 1 {
            self.startingWeight = 135
        }
        
        else {
            self.startingWeight = startingWeight
        }
        
        if description.isEmpty {
            self.description = "no description available"
        }
        
        else {
            self.description = description
        }
    }
}
