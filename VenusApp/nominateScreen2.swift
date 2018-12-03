//
//  nominateScreen2.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 20/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class nominateScreen2: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,getcategories {
 
    
    
    func categories(data: [String]) {
        var elements: String = ""
        for items in data {
            elements.append("\(items)\n")
        }
        categoriesLabel.text = elements
        
        
    }
    
    
    var myPickerView : UIPickerView!
    
    @IBOutlet weak var regionname: UILabel!
    
    @IBAction func chooseNow(_ sender: UIButton) {

        
        let vc = storyboard?.instantiateViewController(withIdentifier: "categories") as! categories
       
       
          vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    var states = ["Andhra Pradesh(Hyderabad)","Arunachal Pradesh(Itanagar)",
        "Assam(Dispur)",
        "Bihar(Patna)",
        "Chhattisgarh(Raipur)",
        "Goa(Panaji)",
"Gujarat(Gandhinagar)",
"Haryana(Chandigarh)",
        "Himachal Pradesh(Shimla)",
        "Jammu & Kashmir(Srinagar)",
        "Jharkhand(Ranchi)",
       " Karnataka(Bangalore)",
        "Kerala(Thiruvananthapuram)",
        "Madhya Pradesh(Bhopal)",
        "Maharashtra(Mumbai)",
        "Manipur(Imphal)",
        "Meghalaya(Shillong)",
        "Mizoram(Aizawl)",
        "Nagaland(Kohima)",
        "Odisha(Bhubaneshwar)",
        "Punjab(Chandigarh)",
        "Rajasthan(Jaipur)",
        "Sikkim(Gangtok)",
        "Tamil Nadu(Chennai)",
        "Telangana(Hyderabad)",
        "Tripura(Agartala)",
        "Uttarakhand(Dehradun)",
        "UttarPradesh(Lucknow)",
        "West Bengal(Kolkata)"]
    
    
    
    
    
    func pickUp(){
        
        // UIPickerView
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(nominateScreen2.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(nominateScreen2.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.regionname.text = states[row]
    }

    
    @objc func doneClick() {

    }
    @objc func cancelClick() {
//regionname.isFirstResponder
        
    }
    
    
    @IBAction func pickRegion(_ sender: UIButton) {
        
        pickUp()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

regionname.isHidden = true
    
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
