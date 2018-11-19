//
//  loginOptions.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 16/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKShareKit
import FirebaseAuth
import Fabric
import TwitterKit

class loginOptions: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate,FBSDKLoginButtonDelegate {
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        print("User logged in")
        fbfir()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,accessToken: authentication.accessToken)
        // ...
    }

    
    @IBAction func googleLogin(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance().signIn()
        GIDSignIn.sharedInstance().signOut()
        
    }
    
    
    @IBAction func loginOptions(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginWithEmail") as! loginWithEmail
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func facebookLogin(_ sender: UIButton) {
        
        fbLogin()
        
    }

    
    func fbLogin()
    {
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, error) in
            if error != nil{
                print("fblogin failed",error)
                
            }
            
            print(result?.token.tokenString)
    }
        fbfir()
    }
    
   func fbfir(){
    
    
    let accesstoken =  FBSDKAccessToken.current()

    guard let accesstokenstring = accesstoken else {return}
    
    let cred = FacebookAuthProvider.credential(withAccessToken: accesstokenstring.tokenString)
    
    
    Auth.auth().signIn(with: cred) { (user, error) in
        if error != nil
        {
            print("Spme error",error ?? "")
            return
        }
        print("Successful",user ?? "")
    }
    
    }
    
    
    fileprivate func loginWithTwitter()
    {
        let twitter = TWTRLogInButton { (session, error) in
            if let err = error
            {
                print("Error logging in twitter",err)
                return
                
            }
            
            print("Login done")
            
            guard let token = session?.authToken else {return}
            guard let secret = session?.authTokenSecret else {return }
            
            
            let cred = TwitterAuthProvider.credential(withToken: token, secret: secret)
            
            Auth.auth().signIn(with: cred, completion: { (user, error) in
                if let error = error{
                    print("error in twitter for firebase",error)
                }
                
                print("successfully twitter  using firebase",user?.uid)
            })
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let twitter = TWTRLogInButton(frame: CGRect(x: 100, y: 100, width: 50, height: 30))
    self.view.addSubview(twitter)
        
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
