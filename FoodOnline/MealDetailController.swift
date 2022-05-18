//  MealDetailController.swift
//  FoodManagement

import UIKit

class MealDetailController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var editMealName: UITextField!
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    @IBAction func btnMap(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "mapKit") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    var meal:Meal?
    //tu copy:cai nay dung.dung lam nut cancel ben ham updateMeal
    enum navicationType {
        case newMeal
        case updateMeal
    }
    var navigationType:navicationType = .newMeal
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: uy quye
        editMealName.delegate = self
        
        //week10 //get meal from table view if it exist
        if let theMeal = meal{
            //Fill the meal information into the meal detail controller
            editMealName.text = theMeal.mealName
            //dua len title
            navigationItem.title = theMeal.mealName
            imageVIew.image = theMeal.maelImages
            ratingControl.ratingValue = theMeal.maelRatingValue
        }
        
       
    }
    //MARK:textFiled's Delegete Funtions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let mealName = textField.text
        {
            //print("Meal Name is: \(mealName)")
            navigationItem.title = mealName
        }
    }
    
   
    //MARK:image processing
    
    @IBAction func imageProcessing(_ sender: UITapGestureRecognizer) {
        editMealName.resignFirstResponder()
        //get image fromphoto libraty
        let imagePicker = UIImagePickerController()
        //config the image source
        imagePicker.sourceType = .photoLibrary
        //uy quyen
        imagePicker.delegate = self
        //show image picker
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageVIew.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    //MARK:navigation
    //cancel
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        //lam nut cancel ham updateMeal 
        if navigationType == .newMeal{
            dismiss(animated: true, completion: nil)
        }
        else{
            if let theNavigationController = navigationController{
                theNavigationController.popViewController(animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIBarButtonItem,button === btnSave{
            //==== la kiem tra button
//            if button === btnSave{
//
//            }
            let mealName = editMealName.text ?? ""
            let mealImage = imageVIew.image
            let ratingValue = ratingControl.ratingValue
            meal = Meal(mealName: mealName, mealImages: mealImage, mealRatingValue: ratingValue)
        }
        
        
    }
}

