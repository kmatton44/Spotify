//
//  TrackPreviewViewController.swift
//  SpotifyClone
//
//  Created by KanoaMatton on 12/10/21.
//

import UIKit
import WebKit
import AVFoundation
import SDWebImage


class TrackPreviewViewController: UIViewController {
    
    public var url: String?
    public var imageURL: String?
    
    private var player: AVPlayer = AVPlayer()
    private var playerItem:AVPlayerItem?
    
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpUI()
        setUpAudioPlayer()
        
    }
    
    
    
    
    private func setUpUI() {
        trackImageView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false

        trackImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        trackImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        trackImageView.heightAnchor.constraint(equalToConstant: trackImageView.frame.width).isActive = true
        
        playButton.topAnchor.constraint(equalTo: trackImageView.bottomAnchor, constant: 20).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    

    private func setUpAudioPlayer() {
        guard let url = url, let imageURL = imageURL, let imageURL = URL(string: imageURL) else {
            return
        }
 
        trackImageView.sd_setImage(with: imageURL, completed: nil)
        
        let trackURL = URL(string: url)
        playerItem = AVPlayerItem(url: trackURL!)
        player = AVPlayer(playerItem: playerItem)
        player.play()
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
        
        if player.rate == 0 {
            player.play()
            playButton.isSelected = false
        } else {
            player.pause()
            playButton.isSelected = true
        }
    }
    
    @IBAction func restartPressed(_ sender: Any) {
        
    }
    
}
