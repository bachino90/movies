//
//  UIView+Extensions.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/7/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

extension UIView {

    func addBlurEffect(style: UIBlurEffect.Style) {
        let darkBlur = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurView, at: 0)
    }
}
