//
//  ExerciseTableViewController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/8/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

// view controller for exercises scene

class ExerciseTableViewController: UITableViewController {
    //MARK: Properties
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var exercises = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //editButton = editButtonItem
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addTapped))
        
        if let savedExercises = loadExercises() {
            exercises += savedExercises
        }
        
        else {
            loadSampleExercises()
        }
                
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ExerciseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExerciseTableViewCell else {
            fatalError("Could not load ExerciseTableViewCell")
        }
        
        let exercise = exercises[indexPath.row]

        // Configure the cell...
        cell.exerciseNameLabel.text = exercise.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newWorkoutController = Storyboard.instantiateViewController(identifier: "NewWorkoutViewController") as! NewWorkoutViewController
        
        let exercise = exercises[indexPath.row]
       // os_log("workout name: %s", newWorkoutController.workouts[0].name)
        
        let newWorkout = Workout(exercises: [exercise], name: "New Workout")!
        
        newWorkoutController.workouts.append(newWorkout)
        newWorkoutController.workouts[0].exercises.append(exercise)
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            exercises.remove(at: indexPath.row)
            saveExercises()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "Add Item":
            os_log("Adding new Exercise", log: OSLog.default, type: .debug)
        
        case "Show Detail":
            guard let exerciseDetailViewController = segue.destination as? CreateNewExerciseController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedExerciseCell = sender as? ExerciseTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedExerciseCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedExercise = exercises[indexPath.row]
            exerciseDetailViewController.exercise = selectedExercise
            
        default:
            fatalError("Unexpected Segue Identifier")
        }
        
        
        
        
    }
    

    //MARK: Actions
    
    // adds a new exercise to the table of exercises and saves
    @IBAction func unwindToExerciseList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? CreateNewExerciseController, let exercise = sourceViewController.exercise {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                exercises[selectedIndexPath.row] = exercise
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            else {
                let newIndexPath = IndexPath(row: exercises.count, section: 0)
                exercises.append(exercise)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            saveExercises()
            
        }
        
        if let sourceViewController = sender.source as? NewWorkoutViewController {
            //sourceViewController.workouts[0].exercises.ap
            os_log("in new workout view Controller")
        }
        
    }
    
    //MARK: Private Methods
    
    // loads preset sample exercises
    private func loadSampleExercises() {
                
        guard let exercise1 = Exercise(name: "Bench Press", reps: 5, sets: 5, startingWeight: 135, description: "While laying flat on the bench, press the bar up away from your body") else {
            fatalError("unable to instantiate Exercise1")
        }
        
        guard let exercise2 = Exercise(name: "Squat", reps: 10, sets: 3, startingWeight: 185, description: "Stand underneath the bar and hold it across your shoulders behind your head. While doing this, squat down until you thighs are parallel with the ground and stand back up") else {
            fatalError("unable to instantiate Exercise1")
        }
        
        guard let exercise3 = Exercise(name: "Military Press", reps: 10, sets: 3, startingWeight: 115, description: "While standing, hold the bar just below your chin and press it up over your head") else {
            fatalError("unable to instantiate Exercise1")
        }
        
        exercises += [exercise1, exercise2, exercise3]
    }
    
    // saves exercises
    private func saveExercises() {
        // 'archiveRootObject(_:toFile:)' was deprecated in iOS 12.0: Use +archivedDataWithRootObject:requiringSecureCoding:error: instead
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(exercises, toFile: Exercise.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
            os_log("reps: %d, sets: %d, starting weight: %d", exercises[0].reps, exercises[0].sets, exercises[0].startingWeight)
        }
        
        else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    // loads previously saved exercises
    private func loadExercises() -> [Exercise]? {
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: Exercise.ArchiveURL.path) as? [Exercise]
    }
}
