//
//  questionScreen.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 28/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class questionScreen: UIViewController {

    
    @IBOutlet weak var showData: UILabel!
    
    
    @IBAction func slider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        showData.text = "I have \(currentValue) employees"
        
        
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
