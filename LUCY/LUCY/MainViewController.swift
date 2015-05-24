//
//  MainViewController.swift
//  LUCY
//
//  Created by Siyu Chen on 5/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let panRec = UIPanGestureRecognizer()
    
    func draggedView(sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x,sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        panRec.addTarget(self, action: "draggedView:")
        label.addGestureRecognizer(panRec)
        label.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
