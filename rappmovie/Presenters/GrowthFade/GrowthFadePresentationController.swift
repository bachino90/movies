//
//  GrowthFadePresentationController.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/9/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class GrowthFadePresentationController: UIPresentationController {

    override var shouldRemovePresentersView: Bool { return false }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = containerView!.bounds
    }
}
