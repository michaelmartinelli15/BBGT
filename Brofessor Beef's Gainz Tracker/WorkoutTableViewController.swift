//
//  WorkoutTableViewController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/9/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

// view controller for workouts scene

class WorkoutTableViewController: UITableViewController {
    
    //MARK: Properties
    var workouts = [Workout]()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        loadSampleWorkouts()
    }

    // MARK: - Table view data source
    
    // these three functions manage the table in this scene
    
    // provides the table with the number of sections in the table. We only have one
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // returns the number of rows needed in the table. This corresponds to the number of exercises in a workout
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    // sets the cell to the appropriate information
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "WorkoutTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorkoutTableViewCell else {
            fatalError("Could not load WorkoutTableViewCell")
        }
        
        let workout = workouts[indexPath.row]
        
        index = indexPath.row

        // Configure the cell...
        cell.workoutNameLabel.text = workout.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MainViewController {
            if let viewController = segue.destination as? MainViewController {
                os_log("from lift button")
                os_log("%s", workouts[0].name)
                //viewController?.workoutLabel?.text = "new workout"
                //viewController.content = MainViewController.Text(workout: workouts[0].name, exercise: <#T##String#>, sets: <#T##Int#>, reps: <#T##Int#>, currentWeight: <#T##Int#>)
                viewController.workout = workouts[0]
            }
        }
    }
    
    
    //MARK: Private Methods
    
    // loads preset sample exercises
    private func loadSampleWorkouts() {
        guard let benchPress = Exercise(name: "Bench Press", reps: 5, sets: 5, startingWeight: 235, description: "Press the bar") else {
            return ()
        }
        
        guard let dumbellBench = Exercise(name: "Dumbell Bench Press", reps: 12, sets: 3, startingWeight: 65, description: "Press the dumbbells while laying on bench") else {
            return ()
        }
        guard let fly = Exercise(name: "Chest Fly", reps: 12, sets: 3, startingWeight: 35, description: "Lay on the bench and spread your arms out and bring them back in") else {
            return ()
        }
        guard let inclineBench = Exercise(name: "Incline Bench Press", reps: 12, sets: 3, startingWeight: 135, description: "Laying on the incline bench, press the bar up") else {
            return ()
        }
        
        
        guard let squat = Exercise(name: "Squat", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 255, description: "Stand up with the bar") else {
            return ()
        }
        guard let lunges = Exercise(name: "Lunges", reps: 12, sets: 3, startingWeight: 40, description: "Holding dumbbells, lunge forward") else {
            return ()
        }
        guard let legPress = Exercise(name: "Leg Press", reps: 12, sets: 3, startingWeight: 285, description: "Press the weight with your legs") else {
            return ()
        }
        
        
        guard let curls = Exercise(name: "Curls", reps: 3, sets: 12, startingWeight: 35, description: "Curl dumbbells toward your biceps") else {
            return ()
        }
        guard let kickbacks = Exercise(name: "Kickbacks", reps: 12, sets: 3, startingWeight: 35, description: "Lean forward and extend your arm back") else {
            return ()
        }
        /*guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }
        guard let deadlift = Exercise(name: "Deadlift", reps: 12, sets: 3, startingWeight: 185, description: "Squat the bar") else {
            return ()
        }*/
        
        
        var chest = [Exercise]()
        var legs = [Exercise]()
        var arms = [Exercise]()
        
        chest.append(benchPress)
        chest.append(dumbellBench)
        chest.append(fly)
        chest.append(inclineBench)
        
        legs.append(squat)
        legs.append(deadlift)
        legs.append(lunges)
        legs.append(legPress)
        
        arms.append(curls)
        arms.append(kickbacks)
        
        workouts.append(Workout(exercises: chest, name: "Chest")!)
        workouts.append(Workout(exercises: legs, name: "Legs")!)
        workouts.append(Workout(exercises: arms, name: "Arms")!)
    }

}
