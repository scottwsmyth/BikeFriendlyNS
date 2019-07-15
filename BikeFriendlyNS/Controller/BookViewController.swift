//
//  BookViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-12.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    
    var feedItems: NSArray = NSArray()
    var blogPostArray: NSArray = NSArray()
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        vc.blogPostArray = self.blogPostArray
        
        vc.feedItems = self.feedItems
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func buyBtnPressed(_ sender: Any) {
        
        guard let link = URL(string: "http://bicycle.ns.ca/where-to-cycle-ns/") else { return  }
        
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.setContentOffset(CGPoint.zero, animated: false)

        containerView.backgroundColor = UIColor.white.withAlphaComponent(0.87)
    
    }
}
