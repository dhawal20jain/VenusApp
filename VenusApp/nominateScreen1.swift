//
//  nominateScreen1.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 20/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit
import ContactsUI
import CoreData
import Contacts
class nominateScreen1: UIViewController,CNContactPickerDelegate {

    var savedata = [User_info]()
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    
    @IBOutlet weak var emailID: UITextField!
    
    
    @IBAction func importfromContacts(_ sender: UIButton) {
        
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addNewContact"), object: nil)


    }
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
   let vc = storyboard?.instantiateViewController(withIdentifier: "nominateScreen2") as! nominateScreen2
        self.navigationController?.pushViewController(vc, animated: true)
        guard let fname = firstName.text , let lname = lastName.text, let email = emailID.text else {return}
        
        
        let appDe = UIApplication.shared.delegate as! AppDelegate
        
        let item = User_info(context: appDe.persistentContainer.viewContext)
        item.name = fname
        item.last_name = lname
        item.email = email
        
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
