//
//  YouTubeView.swift
//  rappmovie
//
//  Created by Restorando on 12/8/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit
import AVFoundation
import YoutubeDirectLinkExtractor

class YouTubeView: UIView {

    @IBOutlet private var contentView: UIView!

    private var player: AVPlayer?
    private let extractor = YoutubeDirectLinkExtractor()

    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("YouTubeView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = Styler.Color.darkGray
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.playVideo))
        self.addGestureRecognizer(tap)
    }

    // MARK: Public interface

    var video: Video? {
        didSet {
            guard let video = self.video else { return }

            extractor.extractInfo(for: .id(video.key), success: { [weak self] info in
                DispatchQueue.main.async {
                    guard let strongSelf = self else { return }
                    // initialize the video player with the url
                    strongSelf.player = AVPlayer(url: URL(string: info.highestQualityPlayableLink!)!)

                    // create a video layer for the player
                    let layer: AVPlayerLayer = AVPlayerLayer(player: strongSelf.player)

                    // make the layer the same size as the container view
                    layer.frame = strongSelf.bounds

                    // make the video fill the layer as much as possible while keeping its aspect size
                    layer.videoGravity = AVLayerVideoGravity.resizeAspectFill

                    // add the layer to the container view
                    strongSelf.layer.addSublayer(layer)

                    strongSelf.play()
                }
            }) { error in
                print(error)
            }
        }
    }

    @objc private func playVideo() {
        if player?.timeControlStatus == .playing {
            stop()
//            playButton.isHidden = false
        } else {
            play()
//            playButton.isHidden = true
        }
    }

    func play() {
        player?.play()
    }

    func stop() {
        player?.pause()
    }
}
