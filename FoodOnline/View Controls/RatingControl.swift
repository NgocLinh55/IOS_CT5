//
//  RatingControl.swift
//  FoodManagement
//


import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK:properties
private var ratingButtons=[UIButton]()
    //rating value
   @IBInspectable var ratingValue :Int = 0{
        didSet{
            updateRatingButtonState()
        }
    }
    //dinh nghia ham moi
    @IBInspectable var starNumber :Int = 5{
        didSet{
            setupRatingControl()
        }
    }
    @IBInspectable var starSize :CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupRatingControl()
        }
    }
    
    //MARK: intialization
   
    override init(frame: CGRect) {
        //MARK:properties
        
//        private var ratingButtons=[UIButton]()
        //MARKintialization
        super.init(frame: frame)
        setupRatingControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupRatingControl()
    }
    //MARK: rating button intitalization
    private func setupRatingControl(){
        //load the rating images
        let burdle = Bundle(for:type(of: self))
        let normal = UIImage(named: "normal",in: burdle, compatibleWith: .none)
        let pressed = UIImage(named: "pressed",in: burdle,compatibleWith: .none)
        let selected = UIImage(named: "selected",in: burdle,compatibleWith: .none)
        //Remove the old rating buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //create rating button let
        
        for _ in 0..<starNumber{
        let button = UIButton()
        button.setImage(normal, for: .normal)
        button.setImage(pressed, for: .highlighted)
        button.setImage(selected, for: .selected)
        //button.backgroundColor = UIColor.red
        //setup button attributes
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = false
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = false
            //add event processcing
            button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
        //add the button to the rating control
            addArrangedSubview(button)
            //add the button to the array to the manage them
            ratingButtons.append(button)
            
        }
        //layuptif needed
        updateRatingButtonState()
    }
    //event processing for button
    @objc private func ratingButtonPressed(button:UIButton){
        if let index = ratingButtons.firstIndex(of: button){
            print("the number of the button is :\(index+1)")
            //layoutif needed()
            if ratingValue == index + 1{
                ratingValue -= 1
            
            }
            else{
                ratingValue = index + 1
            }
            //update the rating button state
            updateRatingButtonState()
            
        }
    }
    private func updateRatingButtonState(){
        for(i,button) in ratingButtons.enumerated(){
            button.isSelected = i < ratingValue
        }
    }
}
