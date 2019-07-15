//
//  HowToUseViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-15.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class HowToUseViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    var feedItems: NSArray = NSArray()
    var blogPostArray: NSArray = NSArray()
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        vc.blogPostArray = self.blogPostArray
        
        vc.feedItems = self.feedItems
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.setContentOffset(CGPoint.zero, animated: false)
        
        containerView.backgroundColor = UIColor.white.withAlphaComponent(0.87)

    }

}
