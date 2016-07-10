//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Willow Belle on 2015-11-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }

    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")

        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])

            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            button.adjustsImageWhenHighlighted = false

            ratingButtons += [button]

            addSubview(button)
        }

    }

    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars

        return CGSize(width: width, height: buttonSize)
    }

    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)

        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }

        updateButtonSelectionStates()
    }

    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }

    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
}
