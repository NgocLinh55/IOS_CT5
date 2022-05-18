//
//  MealTableViewController.swift
//  FoodManagement


import UIKit

class MealTableViewController: UITableViewController {
    // MARK: Properties //week 10
    var mealList = [Meal]()
    //week10
    enum navicationType {
        case newMeal
        case updateMeal
    }
    var navigationType:navicationType = .newMeal

    override func viewDidLoad() {
        super.viewDidLoad()

        if let meal = Meal(mealName: "Táo", mealImages: UIImage(named: "defaultimage") , mealRatingValue: 4){
            mealList += [meal]
        }
        // ADD the edit menu button
        navigationItem.leftBarButtonItem = editButtonItem
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "MealTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? MealTableViewCell{
            //get dataSurce for the table view
            let meal = mealList[indexPath.row]
            //fill the meal infomation into the cell
            cell.mealName.text = meal.mealName
            cell.mealImage.image = meal.maelImages
            cell.ratingControl.ratingValue = meal.maelRatingValue
            return cell
        }
        else{
            fatalError("can not get the cell!")
        }

        

    //return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             //Delete the row from the data source
            mealList.remove(at: indexPath.row)
            //deleto eow from tabble view at indexpath
            tableView.deleteRows(at: [indexPath], with: .none)
        } else if editingStyle == .insert {
//             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
       }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    @IBAction func unWindFromMealDetailToMealTableView(sender:UIStoryboardSegue){
       //print("Called from MealDetail")
        if navigationType == .newMeal{
            //add a new meal
            if let soureceController = sender.source as? MealDetailController{
                if let newMeal = soureceController.meal{
                    let indexPath = IndexPath(row: mealList.count, section: 0)
                    //insert new meal to the mealList
                    mealList += [newMeal]
                    //insert new meal to the table view
                    tableView.insertRows(at: [indexPath], with: .none)
                }
            }
        }
        else{
            //update a meal
            if let soureceController = sender.source as? MealDetailController{
                if let newMeal = soureceController.meal{
                    if let selectedIndexpath = tableView.indexPathForSelectedRow{
                        //update the meal list at the selected indexpath
                        mealList[selectedIndexpath.row] = newMeal
                        //update the row with the at the position selected index path
                        tableView.reloadRows(at: [selectedIndexpath], with: .none)
                    }
                }
            }
        }
        //create new indexPath for the new meal
    }
    //week 10
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Find the way to the meal detail controller
        if let segueName = segue.identifier{
            if segueName == "addMeal"{
                //print("Add New Meal")
                navigationType = .newMeal
                if let destinaltionController = segue.destination as? MealDetailController{
                    //truyen update
                    destinaltionController.navigationType = .newMeal
                }
                
            }
            else{
                //print("updateMeal")
                navigationType = .updateMeal
                if let seclectCell = sender as? MealTableViewCell{
                    //print("Meal table view cell is perssed")
                    let mealName = seclectCell.mealName.text ?? ""
                    let mealImage = seclectCell.mealImage.image
                    let ratingValue = seclectCell.ratingControl.ratingValue
                    let meal = Meal(mealName: mealName, mealImages: mealImage, mealRatingValue: ratingValue)
                    if let destinaltionController = segue.destination as? MealDetailController{
                        destinaltionController.meal = meal
                        //truyen update
                        destinaltionController.navigationType = .updateMeal
                    }
                }
            }
        }
        else{
            print("You must name for the segues!")
        }
    }
}
