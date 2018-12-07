//
//  RoundedButton.swift
//  VenusApp
//
//  Created by DEVESH MANI TRIPATHI on 21/11/18.
//  Copyright © 2018 DEVESH MANI TRIPATHI. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.backgroundColor = #colorLiteral(red: 0.3559046984, green: 0.163688302, blue: 0.4766708612, alpha: 1)
        self.titleLabel?.textColor = UIColor.white
        self.frame.size = CGSize(width: 150, height: 100)
    }

    
    
    
}
