//
//  ExerciseTableViewCell.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/8/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit

// exercise cell

class ExerciseTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var workoutExerciseNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
