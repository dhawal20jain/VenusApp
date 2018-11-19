//
//  SignUpWithEmail.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 16/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpWithEmail: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailId: UITextField!
    
    
    @IBAction func signUp(_ sender: UIButton) {
        
        if let user = emailId.text, let pass = password.text{
            
            Auth.auth().createUser(withEmail: user, password: pass) { (result, error) in
                
                if let r = result{
                    print("Successful")
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginWithEmail") as! loginWithEmail
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    
                }
                else
                {
                    print("Unsuccessful")
                    print(error?.localizedDescription ?? "")
                }
            }
        }
        
    }
    
    
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
