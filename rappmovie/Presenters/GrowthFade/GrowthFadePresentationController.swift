//
//  GrowthFadePresentationController.swift
//  rappmovie
//
//  Created by Restorando on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class GrowthFadePresentationController: UIPresentationController {

    var height: CGFloat = 375

    override var shouldRemovePresentersView: Bool { return false }

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

//    override var frameOfPresentedViewInContainerView: CGRect {
//        return CGRect(x: 0, y: containerView!.bounds.height - height, width: containerView!.bounds.width, height: height)
//    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = containerView!.bounds
    }

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()

//        dimmingView.frame = containerView!.bounds
//        dimmingView.alpha = 0.0
//        dimmingView.backgroundColor = UIColor.black
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
//        dimmingView.addGestureRecognizer(tapRecognizer)
//
//        containerView?.insertSubview(dimmingView, at: 0)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
//            self.dimmingView.alpha = 0.5
        }, completion: nil)
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
//            self.dimmingView.alpha = 0.0
        })
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
//            self.dimmingView.removeFromSuperview()
        }
    }

}
