//
//  GrowthFadeDismissAnimationController.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class GrowthFadeDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.13
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let fromSnapshot = fromVC.view.snapshotView(afterScreenUpdates: true)
            else { return }

        fromSnapshot.frame = fromVC.view.frame

        let containerView = transitionContext.containerView
        containerView.addSubview(fromSnapshot)
        fromVC.view.isHidden = true

        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: { () -> Void in
            fromSnapshot.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            fromSnapshot.alpha = 0
        }) { (completed) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
