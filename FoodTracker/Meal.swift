//
//  Meal.swift
//  FoodTracker
//
//  Created by Noam Rubin on 12/23/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import UIKit

class Meal {

    //MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
