//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Noam Rubin on 12/16/16.
//  Copyright © 2016 Noam Rubin. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var rating_buttons = [UIButton]()
    var rating = 0 {
        didSet {
                updateButtonSelectionStates()
            }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
//        print("Button pressed 👍")
        guard let index = rating_buttons.index(of: button) else {
            fatalError("The button, \(button), is not in the rating_buttons array: \(rating_buttons)")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    //MARK: Private methods
    private func setupButtons() {
        
        //clear existing buttons
        for button in rating_buttons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        rating_buttons.removeAll()
        
        //adding button images
        let bundle = Bundle(for: type(of:self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        //add desired number of buttons
        for _ in 0..<starCount {
        
        let button = UIButton()
//        button.backgroundColor = UIColor.red
        button.setImage(emptyStar, for: .normal)
        button.setImage(filledStar, for: .selected)
        button.setImage(highlightedStar, for: .highlighted)
        button.setImage(highlightedStar, for: [.highlighted, .selected])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        addArrangedSubview(button)
        rating_buttons.append(button)
        }
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in rating_buttons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
