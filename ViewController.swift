//
//  ViewController.swift
//  firebase1
//
//  Created by Akshay Devkate on 28/10/19.
//  Copyright © 2019 Akshay Devkate. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
  
    
    var videoPlayer:AVPlayer?
     
     var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up video in the background
        setUpVideo()
    }
    
    
    func setUpElements(){
        
    }
    
func setUpVideo(){
        
    
   // Get the path to the resource in the bundle
         let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
         
         guard bundlePath != nil else {
             return
         }
         
         // Create a URL from it
         let url = URL(fileURLWithPath: bundlePath!)
         
         // Create the video player item
         let item = AVPlayerItem(url: url)
         
         // Create the player
         videoPlayer = AVPlayer(playerItem: item)
         
         // Create the layer
         videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
         
         // Adjust the size and frame
    videoPlayerLayer?.frame = CGRect(x:20, y:20, width:  -self.view.frame.size.width, height: -self.view.frame.size.height)
         
         view.layer.insertSublayer(videoPlayerLayer!, at: 0)
         
         // Add it to the view and play it
         videoPlayer?.playImmediately(atRate: 0.3)
     }

}

    

