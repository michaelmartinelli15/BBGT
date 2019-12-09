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
    
    init?(name: String, reps: Int, sets: Int, startingWeight: Int, description: String) {
        /*guard !name.isEmpty else {
            return nil
        }
        
        guard !(reps <= 0) else {
            return nil
        }
        
        guard !(sets <= 0) else {
            return nil
        }
        
        guard !(startingWeight <= 0) else {
            return nil
        }
        
        guard !description.isEmpty else {
            return nil
        }*/
        
        self.name = name
        self.reps = reps
        self.sets = sets
        self.startingWeight = startingWeight
        self.description = description
    }
}
