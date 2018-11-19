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
                    print("Succresful")
                self.username.text = ""
                self.password.text = ""
                }
                else {
                
                    print("Unsuccessful")
                    
                }
            }
        }
    }
    
            
    @IBAction func goToSignupButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpWithEmail") as! SignUpWithEmail
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        forgotEmaillabel.isHidden = true
        forgortPasswordLabel.isHidden = true
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
