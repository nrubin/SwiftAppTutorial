//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Noam Rubin on 12/23/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    //MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
