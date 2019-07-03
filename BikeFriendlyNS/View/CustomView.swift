//
//  CustomView.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-03.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true

    }

}
