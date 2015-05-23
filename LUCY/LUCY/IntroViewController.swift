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
    
    @IBOutlet weak var loginUsernameText: UITextField!
    
    @IBOutlet weak var loginPasswordText: UITextField!
    
    var moviePlayer: MPMoviePlayerController?
    
    let panRec = UIPanGestureRecognizer()
    
    func draggedView(sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x,sender.view!.center.y)
        // can only drag in x-direction
        sender.setTranslation(CGPointZero, inView: self.view)
    }

    
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
        
        if loginUsernameText.text == "" || loginPasswordText.text == "" {
            
            // generate alert if blank
            var alert = UIAlertController(title: "Error", message: "Please enter a phone# or a password", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:
                
                {(action) -> Void in
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            // replay video after alert
            self.playVideo();
        }
        
        
        
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
            
            // panswipe video
            panRec.addTarget(self, action: "draggedView:")
            player.view.addGestureRecognizer(panRec)
            player.view.userInteractionEnabled = true
            
            
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
