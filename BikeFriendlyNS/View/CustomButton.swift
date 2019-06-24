//
//  CustomButton.swift
//  BIkeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.5
        let opacity:CGFloat = 0.3
        let borderColor =  UIColor.white
        layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
    }

}
