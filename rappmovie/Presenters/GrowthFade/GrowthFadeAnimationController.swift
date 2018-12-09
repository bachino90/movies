//
//  GrowthFadeAnimationController.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class GrowthFadeAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.13
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }

        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)

        toVC.view.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        toVC.view.alpha = 0
        toVC.view.layoutIfNeeded()

        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { () -> Void in
            toVC.view.alpha = 1
            toVC.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { (completed) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
