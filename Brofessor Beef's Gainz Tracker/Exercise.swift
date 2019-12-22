//
//  Exercise.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/7/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

// exercise data structure

class Exercise : NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var reps: Int
    var sets: Int
    var startingWeight: Int
    var exDescription: String
    
    //MARK: Archiveing Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("exercises")
    
    //MARK: Types
    struct propertyKey {
        static let name = "name"
        static let reps = "reps"
        static let sets = "sets"
        static let startingWeight = "startingWeight"
        static let exDescription = "description"
        
    }
    
    //MARK: Initialization
    
    init?(name: String, reps: Int, sets: Int, startingWeight: Int, description: String) {
        self.name = name
        self.reps = reps
        self.sets = sets
        self.startingWeight = startingWeight
        self.exDescription = description
    }
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: propertyKey.name)
        coder.encode(sets, forKey: propertyKey.sets)
        coder.encode(reps, forKey: propertyKey.reps)
        coder.encode(startingWeight, forKey: propertyKey.startingWeight)
        coder.encode(exDescription, forKey: propertyKey.exDescription)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String else {
            os_log("Unable to decode the name for an Exercise object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        /*guard let sets = aDecoder.decodeObject(forKey: propertyKey.sets) as? Int else {
            os_log("Unable to decode the sets for an Exercise object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let reps = aDecoder.decodeObject(forKey: propertyKey.reps) as? Int else {
            os_log("Unable to decode the reps for an Exercise object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let startingWeight = aDecoder.decodeObject(forKey: propertyKey.startingWeight) as? Int else {
            os_log("Unable to decode the starting weight for an Exercise object.", log: OSLog.default, type: .debug)
            return nil
        }*/
        
        guard let description = aDecoder.decodeObject(forKey: propertyKey.exDescription) as? String else {
            os_log("Unable to decode the description for an Exercise object.", log: OSLog.default, type: .debug)
            return nil
        }
        /*
        let sets = aDecoder.decodeObject(forKey: propertyKey.sets)
        let reps = aDecoder.decodeObject(forKey: propertyKey.reps)
        let startingWeight = aDecoder.decodeObject(forKey: propertyKey.startingWeight)
        let description = aDecoder.decodeObject(forKey: propertyKey.exDescription)
        */
        
        let sets = aDecoder.decodeInteger(forKey: propertyKey.sets) //as? Int ?? 0
        let reps = aDecoder.decodeInteger(forKey: propertyKey.reps) //as? Int ?? 0
        let startingWeight = aDecoder.decodeInteger(forKey: propertyKey.startingWeight) //as? Int ?? 0
        
        self.init(name: name, reps: reps , sets: sets , startingWeight: startingWeight , description: description )
    }
}
