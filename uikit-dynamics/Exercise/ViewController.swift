//
//  ViewController.swift
//  Exercise
//
//  Created by Willow Bumby on 2016-02-16.
//  Copyright © 2016 Willow Bumby. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: Properties
    // Animator properties
    var animator = UIDynamicAnimator() {
        didSet {
            // The animator will only listen to behaviors added on view/subviews on self.view
            animator = UIDynamicAnimator(referenceView: view)
        }
    }
    
    var overlayView: UIView? {
        didSet {
            // Set the background colour to red
            overlayView?.backgroundColor = .redColor()
            
            // Enable interaction/accepting touches on view
            overlayView?.userInteractionEnabled = true
        }
    }
    
    // MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call setup method while controller is setting up (initially)
        self.setup()
    }
    
    func setup() {
    
        // Initialise new UIView with frame
        let newlyCreatedView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0))
        
        // Create tap gesture recogniser to respond to touches on view
        // The action is a string because Selector() isn't bridged yet
        // If the string action doesn't match any methods in `self`, the app will crash
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "overlayViewPressed:")
        // Add "1" as the number of taps that are required before the gesture recogniser is fired
        gestureRecognizer.numberOfTapsRequired = 1
        
        // Add the gesture recogniser to the newly created view
        newlyCreatedView.addGestureRecognizer(gestureRecognizer)
        
        // Assign overlayView to newlyCreatedView
        overlayView = newlyCreatedView
    }
    
    // MARK: Actions
    @IBAction func buttonPressed(sender: UIButton) {
        
        // Check that overlayView is not nil
        guard let overlayView = overlayView else { return }
        // Add overlayView to the controller's base view (self.view)
        view.addSubview(overlayView)
        
        // Create new snap behaviour
        // Snap overlay view to view.center
        let snap = UISnapBehavior(item: overlayView, snapToPoint: view.center)
        
        // Schedule/Add behaviour to animator
        animator.addBehavior(snap)
    }
    
    func overlayViewPressed(sender: UITapGestureRecognizer) {
        // Remove the snap behaviour
        animator.removeAllBehaviors()
        
        // Check that overlayView is not nil
        guard let overlayView = overlayView else { return }
        
        // Create new gravity behaviour
        let gravity = UIGravityBehavior(items: [overlayView])
        
        // Schedule/Add behaviour to animator
        animator.addBehavior(gravity)
        
        // Create new standard/item behaviour
        let item = UIDynamicItemBehavior(items: [overlayView])
        
        // Add angular velocity so overlayView twists when it falls
        item.addAngularVelocity(CGFloat(-M_PI), forItem: overlayView)
        
        // Schedule/Add behaviour to animator
        animator.addBehavior(item)
        
        // New animation with duration closure
        // Alternative ways of writing a closure
        // UIView.animateWithDuration(1, animations: { _ -> Void in
        // UIView.animateWithDuration(1, animations: { () -> Void in
        UIView.animateWithDuration(1, animations: { _ in
            // Animate changing the alpha from 1.0 to 0.5 over one second
            self.overlayView!.alpha = 0.5
            
            // Alternative ways of writing a closure
            // }) { success -> Void in
            // }) { (success) -> Void in
            // }) { (success) in
            }) { success in
                // Remove all behaviours (gravity and item)
                self.animator.removeAllBehaviors()
                
                // Remove overlayView from superview
                self.overlayView!.removeFromSuperview()
                
                // Nil out overlayView
                self.overlayView = nil
                
                // Recreate overlayView in setup()
                self.setup()
        }
    }
}