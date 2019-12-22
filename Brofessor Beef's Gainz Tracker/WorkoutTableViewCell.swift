//
//  WorkoutTableViewCell.swift
//  Brofessor Beef's Gainz Tracker
//
//  Created by Michael Martinelli on 12/9/19.
//  Copyright © 2019 Michael Martinelli. All rights reserved.
//

import UIKit

// cell for workout table, only has a label

class WorkoutTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
