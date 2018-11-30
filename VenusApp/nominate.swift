//
//  nominate.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 20/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
class nominate: UIViewController,CNContactPickerDelegate{

   
    @IBAction func nn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "nominateScreen1") as! nominateScreen1
    
        self.navigationController?.pushViewController(vc, animated: true)
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
