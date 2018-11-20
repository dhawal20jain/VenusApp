//
//  ForgorPassword.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 19/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ForgorPassword: UIViewController {

    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    @IBAction func sendLink(_ sender: UIButton) {
        
        Auth.auth().sendPasswordReset(withEmail: password.text!) { (error) in
            guard let err = error else {return}
            if err != nil
            {
                print("Some firebase error",err.localizedDescription)
                
                
                let alertController = UIAlertController(title: "Some error", message: "\(err.localizedDescription)", preferredStyle: .alert)

                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    UIAlertAction in
           print("Ok pressed")
                }
             alertController.addAction(okAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            
            
            print("Success")

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "emailSent")
            
            self.present(vc!, animated: true, completion: nil)
            
            }
        
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        

    self.dismiss(animated: true, completion: nil)
        
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
