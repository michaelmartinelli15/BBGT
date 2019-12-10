//
//  NewWorkoutViewController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/9/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

class NewWorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var exerciseTableView: ExerciseList!
    
    var exercises = [Exercise]()
    var workouts = [Workout]()
    
    /*init?(workout: Workout, exercises: [Exercise]) {
        super.init()
        for exercise in exercises {
            workout.exercises.append(exercise)
        }
        
       
    }*/
    
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // assigns data source to tableview
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        
        loadSampleExercises()
        
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts[0].exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ExerciseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ExerciseTableViewCell else {
            fatalError("Could not load ExerciseTableViewCell")
        }
        
        let exercise = workouts[0].exercises[indexPath.row]
        os_log("cell exercise: %s", exercise.name)
        
        cell.workoutExerciseNameLabel.text = exercise.name
        
        return cell
    }
    
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
        
        exercises.append(exercise1)
        exercises.append(exercise2)
        exercises.append(exercise3)
        
        workouts.append(Workout(exercises: exercises, name: "initial")!)
        os_log("added %s, with first exercise %s", workouts[0].name, workouts[0].exercises[0].name)

        /*workouts[0].exercises.append(exercise1)
        workouts[0].exercises.append(exercise2)
        workouts[0].exercises.append(exercise3)*/
    }
    
    /*private func loadWorkout() {
        workouts.append(Workout(exercises: <#T##[Exercise]#>, name: <#T##String#>))
    }*/

}
