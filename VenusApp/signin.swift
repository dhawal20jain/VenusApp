//
//  signin.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 16/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit
class signin: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate,FBSDKLoginButtonDelegate{
   
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("User logged in")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }
    
    
    
    @IBAction func signout(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Successful signout")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        // ...
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fbbut = FBSDKLoginButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        self.view.addSubview(fbbut)
         fbbut.delegate = self
        
        
        let button = GIDSignInButton()
        button.center = view.center
       self.view.addSubview(button)
          GIDSignIn.sharedInstance().uiDelegate = self
        
        
      
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
