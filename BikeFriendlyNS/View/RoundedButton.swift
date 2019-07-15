//
//  RoundedButton.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-12.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5

    }

}
