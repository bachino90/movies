//
//  VideoViewController.swift
//  rappmovie
//
//  Created by Restorando on 12/8/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet private var youtubeView: YouTubeView!

    private let video: Video

    init(video: Video) {
        self.video = video
        super.init(nibName: "VideoViewController", bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addBlurEffect(style: .dark)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        youtubeView.video = video
    }

    @IBAction func dismiss() {
        youtubeView.stop()
        dismiss(animated: true)
    }
}
