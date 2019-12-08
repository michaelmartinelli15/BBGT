//
//  CreateNewExerciseController.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/7/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit

class CreateNewExerciseController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
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
    
    //MARK: Actions
    
    
    @IBAction func testButton(_ sender: UIButton) {
        nameLabel.text = "default Text"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
    }


}
