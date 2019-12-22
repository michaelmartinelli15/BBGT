//
//  MainViewController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/9/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

// View Controller for the main workout tab

class MainViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var currentWeightLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var navForward: UIButton!
    @IBOutlet weak var navBackward: UIButton!
    
    
    var workout: Workout?
    var index = 0
    
   /* init(workoutLabel: UILabel, exerciseLabel: UILabel, setsLabel: UILabel, repsLabel: UILabel, currentWeightLabel: UILabel) {
        workoutLabel.text = "Default Workout"
        exerciseLabel.text = "Default Exercise"
        
    }*/
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // initializes the view
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //workoutLabel.text = text
        workoutLabel.text = workout?.name ?? "Chest"
        exerciseLabel.text = workout?.exercises[index].name ?? "Bench Press"
        /*setsLabel.text = String(describing: workout?.exercises[0].sets)
        repsLabel.text = String(describing: workout?.exercises[0].reps)*/
        setsLabel.text = "\((workout?.exercises[index].sets) ?? 5)"
        repsLabel.text = "\((workout?.exercises[index].reps) ?? 5)"
        currentWeightLabel.text = "\((workout?.exercises[index].startingWeight) ?? 135)"
        
        stepper.value = Double(workout?.exercises[index].startingWeight ?? 135)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    // manages the stepper button
    @IBAction func clicker(_ sender: UIStepper) {
        currentWeightLabel.text = "\(Int(stepper.value))"
    }
    
    // manages forward navigation through a workout
    @IBAction func nextExercise(_ sender: UIButton) {
        if index < workout?.exercises.count ?? 0 {
            index += 1
            os_log("index changed to %d", index)
            viewDidLoad()
        }
    }
    
    // manages backward navigation through a workout
    @IBAction func prevExercise(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            os_log("index changed to %d", index)
            viewDidLoad()
        }
    }
    
    

}
