//
//  ExerciseTableViewController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/8/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController {
    //MARK: Properties
    
    var exercises = [Exercise]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        loadSampleExercises()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Private Methods
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
}
