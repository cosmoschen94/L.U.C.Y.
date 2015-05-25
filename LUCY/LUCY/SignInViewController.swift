//
//  SignInViewController.swift
//  LUCY
//
//  Created by Siyu Chen on 5/25/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

import UIKit
import Parse


class SignInViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    @IBAction func loginButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var loginUsername: UITextField!
    
    @IBOutlet weak var loginPassword: UITextField!
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
