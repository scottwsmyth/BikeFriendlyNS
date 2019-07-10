//
//  PopUpViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-02.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBAction func okayBtnPressed(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(white: 1, alpha: 0.8)
        
        // Do any additional setup after loading the view.
    }
}
