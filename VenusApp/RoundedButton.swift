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
        self.layer.cornerRadius = self.frame.height/2
    }

}
