//
//  ViewController.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 14/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
class ViewController: UIViewController ,GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        
        let but = GIDSignInButton()
        but.center = view.center
        self.view.addSubview(but)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

