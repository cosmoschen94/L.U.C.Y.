//
//  IntroViewController.swift
//  LUCY
//
//  Created by William Gu on 5/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

import UIKit
import MediaPlayer
class IntroViewController: UIViewController {

    var moviePlayer: MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playVideo();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func playVideo() ->Bool {
        
        //take path of video
        let pathURL = NSURL(fileURLWithPath: "background.mp4");
                
        moviePlayer = MPMoviePlayerController(contentURL: pathURL)
        //asigning video to moviePlayer
        
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            //setting the video size to the view size
            
            player.controlStyle = MPMovieControlStyle.None
            //Hiding the Player controls
            
            
            player.prepareToPlay()
            //Playing the video
            
            
            player.repeatMode = .One
            //Repeating the video
            
            player.scalingMode = .AspectFill
            //setting the aspect ratio of the player
            
            self.view.addSubview(player.view)
            //adding the player view to viewcontroller
            return true
            
        }
        return false
    }
    
    

}
