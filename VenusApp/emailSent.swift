
//
//  emailSent.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 20/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import MessageUI
class emailSent: UIViewController,MFMailComposeViewControllerDelegate {

    
    
    @IBAction func contactUs(_ sender: UIButton) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients(["help@venusawards.co.uk"])
        composeVC.setSubject("")
        composeVC.setMessageBody("", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    
    
    private func mailComposeController(controller: MFMailComposeViewController,
                               didFinishWithResult result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
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
