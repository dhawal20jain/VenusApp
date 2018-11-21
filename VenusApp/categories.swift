//
//  categories.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 21/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

protocol getcategories {
    func categories(data : [String])

}



class categories: UIViewController,UITableViewDelegate
,UITableViewDataSource{
    
    
    var delegate: getcategories!
    
    
    
    var selectedItems = [String]()

    let categories = ["Business Mother Of The Year","Business Of The Year","Customer Service","Director Of The Year","Employee Of The Year","Entreprenuer Of The Year","Influential Woman","Inspirational Woman","Lifetime Achievement","Manager Of The Year","New Business"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if let sr = tableView.indexPathsForSelectedRows {
            if sr.count == 5 {
                let alertController = UIAlertController(title: "Oops", message:
                    "You are limited to 5 selections", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                }))
                self.present(alertController, animated: true, completion: nil)
                
                return nil
            }
        }
        
        return indexPath
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected  \(categories[indexPath.row])")
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.isSelected {
                cell.accessoryType = .checkmark
                cell.tintColor = UIColor.purple

                
                selectedItems.append(categories[indexPath.row])
                
            }
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print("deselected  \(categories[indexPath.row])")
        if selectedItems.contains(categories[indexPath.row]){
            if let index = selectedItems.index(of: categories[indexPath.row]) {
            selectedItems.remove(at: index)
            }
        }
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            
        }
        
        if let sr = tableView.indexPathsForSelectedRows {
            print("didDeselectRowAtIndexPath selected rows:\(sr)")
        }
    }
    

    
    @objc func nextPage()
    {
        
        delegate.categories(data: selectedItems)

        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(nextPage))
        
        
        navigationController?.isToolbarHidden = false

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



