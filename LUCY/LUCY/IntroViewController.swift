//
//  IntroViewController.swift
//  LUCY
//
//  Created by William Gu on 5/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
class IntroViewController: UIViewController {

    @IBOutlet weak var labelXIB : UILabel!
    var moviePlayer: MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        self.playVideo();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func login(){
        moviePlayer!.stop();
        let mainVC = MainViewController(nibName:"MainViewController", bundle:nil)
        self.presentViewController(mainVC, animated: true, completion: nil);
        
    }
    func playVideo() ->Bool {
        
        //take path of video
        let pathURL = NSBundle.mainBundle().pathForResource("test", ofType: "mp4");
        let url = NSURL.fileURLWithPath(pathURL!);

        moviePlayer = MPMoviePlayerController(contentURL: url);
        //asigning video to moviePlayer
        
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            //setting the video size to the view size
            
            player.controlStyle = MPMovieControlStyle.None
            //Hiding the Player controls
            
            
            player.prepareToPlay()
            //Playing the video
            
            
            player.repeatMode = MPMovieRepeatMode.One
            //Repeating the video
            
            player.scalingMode = MPMovieScalingMode.AspectFill
            //setting the aspect ratio of the player
            self.view.addSubview(player.view);
            self.view.sendSubviewToBack(player.view);
//            self.view.insertSubview(player.view, belowSubview: self.labelXIB)
            //adding the player view to viewcontroller
            player.play()

            return true
            
        }
        return false
    }
    
    

}
