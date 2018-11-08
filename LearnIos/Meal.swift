//
//  Meal.swift
//  LearnIos
//
//  Created by 杜李 on 2018/11/8.
//  Copyright © 2018 杜李. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialzation
    init?(name: String, photo: UIImage?, rating: Int){
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
