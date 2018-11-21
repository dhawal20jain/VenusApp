//
//  Screen1_Welcome.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 16/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class Screen1_Welcome: UIViewController {

    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var applyForAnAward: UIButton!
    @IBOutlet weak var nominate_Someone: UIButton!
    
    @IBAction func logIn(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginOptions") as! loginOptions

        self.navigationController?.pushViewController(vc, animated: true)
        

    }

    
    
    @IBAction func nominateSomeone(_ sender: UIButton) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "nominateScreen2") as! nominateScreen2
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        
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
