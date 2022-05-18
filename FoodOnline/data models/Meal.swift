//Meal.swift

import UIKit
class Meal {
    var mealName:String
    var maelImages:UIImage?
    var maelRatingValue:Int
    //Contructor
    init?(mealName:String,mealImages:UIImage?,mealRatingValue:Int){
        if mealName.isEmpty{
            return nil
        }
        if mealRatingValue < 0 || mealRatingValue > 5{
            return nil
        }
       
        self.mealName=mealName
        self.maelImages=mealImages
        self.maelRatingValue=mealRatingValue
    }
}
