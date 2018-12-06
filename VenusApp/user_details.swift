//
//  user_details.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 04/12/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class user_details: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var gender: UITextField!
    let pickerData = ["Male", "Female","Other"]
    
    var myPickerView : UIPickerView!

    func pickUp(_ textField : UITextField){
        
    }
    
    @IBOutlet weak var dob: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.gender.text = pickerData[row]
    }
    //MARK:- TextFiled Delegate
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUp(gender)
    }
    
    
    @objc func doneClick() {
        gender.resignFirstResponder()
    }
  @objc func cancelClick() {
        gender.resignFirstResponder()
    }
    
    
    
    @IBAction func dob(_ sender: Any) {
        let datepicker : UIDatePicker = UIDatePicker()
        datepicker.datePickerMode  = UIDatePickerMode.date

        datepicker.addTarget(self, action: #selector(user_details.doneClick), for: UIControlEvents.valueChanged)
        
    }
    
    

    
        override func viewDidLoad() {
        super.viewDidLoad()
            
          //Mark
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        gender.inputView = self.myPickerView
        
        // ToolBar
        let toolBarr = UIToolbar()
        toolBarr.barStyle = .default
        toolBarr.isTranslucent = true
        toolBarr.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBarr.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(user_details.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(user_details.cancelClick))
        toolBarr.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBarr.isUserInteractionEnabled = true
        gender.inputAccessoryView = toolBarr

        // Do any additional setup after loading the view.
    }


}
