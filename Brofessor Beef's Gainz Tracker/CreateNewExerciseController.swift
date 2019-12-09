//
//  CreateNewExerciseController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/7/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit
import os.log

class CreateNewExerciseController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var startingWeightTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var exercise: Exercise?
    
    //MARK: UITextFieldDelegate
    
        // called when user taps return button on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
        // called after textFieldShouldReturn
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabel.text = nameTextField.text
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIButton, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let sets = String(setsTextField.text ?? "")
        let reps = String(repsTextField.text ?? "")
        let startingWeight = String(startingWeightTextField.text ?? "")
        let description = descriptionTextField.text ?? ""
        
        let setsInt: Int = Int(sets) ?? 0
        let repsInt: Int = Int(reps) ?? 0
        let startingWeightInt: Int = Int(startingWeight) ?? 0
        
        exercise = Exercise(name: name, reps: repsInt, sets: setsInt, startingWeight: startingWeightInt, description: description)
    }
    
    //MARK: Actions
    
    
    @IBAction func testButton(_ sender: UIButton) {
        nameLabel.text = "default Text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        setsTextField.delegate = self
        repsTextField.delegate = self
        startingWeightTextField.delegate = self
        descriptionTextField.delegate = self
    }


}
