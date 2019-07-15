//
//  NewsContentViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-08.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class NewsContentViewController: UIViewController {

    @IBOutlet weak var newsContentTitle: UILabel!
    @IBOutlet weak var newsContentImage: UIImageView!
    @IBOutlet weak var newsContentBlurb: UITextView!
    
    var passedTitle = ""
    var passedImage = ""
    var passedContentBlurb = ""
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.newsContentBlurb.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.tintColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)

        newsContentTitle.text = passedTitle
        newsContentImage.image = UIImage(named: passedImage)
        newsContentBlurb.text = passedContentBlurb
        
        // Do any additional setup after loading the view.
    }

}
