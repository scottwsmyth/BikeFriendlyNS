//
//  ViewController.swift
//  BIkeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func beginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self) //Segue from welcome screen to the MapViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

