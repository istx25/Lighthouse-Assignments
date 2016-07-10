//
//  FloatingMenuController.swift
//  Floating-Heads
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

class FloatingMenuController: UIViewController {

    var closeButton: FloatingButton?
    var fromView: UIView?

    var buttonPadding: CGFloat = 70.0
    var buttonItems = [FloatingButton]()

    // MARK: Initialisation
    init (fromView: UIView) {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .OverCurrentContext
        modalTransitionStyle = .CrossDissolve

        self.fromView = fromView
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        configureButtons()
    }

    // MARK: Setup and Configuration
    private func setupUI() {
        let center = presentingViewController!.view.convertPoint(fromView!.center, fromView: fromView!.superview)
        closeButton = FloatingButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        guard let close = closeButton else { return }
        close.center = center
        close.backgroundColor = .flatRedColor()
        close.setImage(UIImage(named: "icon-close"), forState: .Normal)
        close.addTarget(self, action: "dismissFloatingMenuController", forControlEvents: .TouchUpInside)
        view.addSubview(close)

        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blurView.frame = view.frame
        view.insertSubview(blurView, belowSubview: close)

        for button in buttonItems {
            button.center = center
            button.center.y = center.y - buttonPadding
            view.addSubview(button)

            buttonPadding += 70
        }
    }

    private func configureButtons() {
        closeButton!.center = fromView!.center
    }

    // MARK: Actions
    func dismissFloatingMenuController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
