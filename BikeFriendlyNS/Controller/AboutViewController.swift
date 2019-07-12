//
//  AboutViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    var feedItems: NSArray = NSArray()
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let menuVC = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        menuVC.feedItems = self.feedItems
        
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(feedItems[0])
        
        // Do any additional setup after loading the view.
    }

}
