//
//  choosepic.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 28/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class choosepic: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var image1: UIImageView!
    var image = UIImagePickerController()
    
    @IBAction func getFromGallery(_ sender: UIButton) {
   image.sourceType = .photoLibrary
        image.allowsEditing = false
        image.sourceType = .photoLibrary
        image.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(image, animated: true, completion: nil)

    
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedimage =  info[UIImagePickerControllerOriginalImage] as! UIImage
        image1.contentMode = .scaleAspectFit
        image1.image = selectedimage
        dismiss(animated: true, completion: nil)


    }
    
    @IBAction func getFromCamera(_ sender: UIButton) {
   image.sourceType = .camera
        image.allowsEditing = true
        image.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
    present(image, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
image.delegate = self
        
        self.image1.layer.cornerRadius = self.image1.frame.size.height / 2
        self.image1.clipsToBounds = true
       // self.image1.layer.borderWidth = 1
        self.image1.layer.borderColor = #colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1)

        
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
