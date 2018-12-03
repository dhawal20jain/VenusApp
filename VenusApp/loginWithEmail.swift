//
//  loginWithEmail.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 16/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class loginWithEmail: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var forgortPasswordLabel: UILabel!
    
    @IBOutlet weak var forgotEmaillabel: UILabel!
    
    @IBAction func login(_ sender: UIButton) {
   
        if let user = username.text, let pass = password.text{
        
            Auth.auth().signIn(withEmail: user, password: pass) { (data, error) in
                
                
               if let d = data{
                    print("Successful")
                let alert = UIAlertController(title: "Successful", message: "Login Successful", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "nominate") as! nominate
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                
                }))
                    self.present(alert, animated: true, completion: nil)

                self.username.text = ""
                self.password.text = ""
                
                }
                else {
                
                    print("Unsuccessful")
                let alert = UIAlertController(title: "\(error?.localizedDescription ?? "")", message: "Login UnSuccessful", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
                }
            }
        }
    }
    
            
    @IBAction func goToSignupButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpWithEmail") as! SignUpWithEmail
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgorPassword
        
self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        forgotEmaillabel.isHidden = true
        forgortPasswordLabel.isHidden = true
    }


    @IBAction func cancel(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    

}
