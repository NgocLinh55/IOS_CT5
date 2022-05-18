//
//  MealTableViewCell.swift
//  FoodManagement


import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK:properties
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
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
