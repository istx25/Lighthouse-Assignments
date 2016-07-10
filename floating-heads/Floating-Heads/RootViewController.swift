//
//  RootViewController.swift
//  Floating-Heads
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: Controller Setup
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    // MARK: Actions
    @IBAction func plusButtonPressed(sender: FloatingButton) {
        let floatingMenuController = FloatingMenuController(fromView: sender)

        let one = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        one.setImage(UIImage(named: "model-004"), forState: .Normal)

        let two = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        two.setImage(UIImage(named: "model-005"), forState: .Normal)

        let three = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        three.setImage(UIImage(named: "model-006"), forState: .Normal)

        let four = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        four.setImage(UIImage(named: "model-007"), forState: .Normal)

        let five = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        five.setImage(UIImage(named: "model-008"), forState: .Normal)

        floatingMenuController.buttonItems = [one, two, three, four, five]

        presentViewController(floatingMenuController, animated: true, completion: nil)
    }
}

