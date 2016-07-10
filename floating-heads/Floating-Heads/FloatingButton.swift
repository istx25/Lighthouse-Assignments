//
//  FloatingButton.swift
//  Floating-Heads
//
//  Created by Willow Belle on 2015-11-25.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

import UIKit

@IBDesignable
public class FloatingButton: UIButton {

    // MARK: Initialisation
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: View Lifecycle
    public override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        setup()
    }

    // MARK: Setup Customisations
    private func setup() {
        tintColor = .whiteColor()
        backgroundColor = .flatBlueColor()
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
