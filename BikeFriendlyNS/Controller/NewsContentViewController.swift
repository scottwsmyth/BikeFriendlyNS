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
        
        newsContentTitle.text = passedTitle
        newsContentImage.image = UIImage(named: passedImage)
        newsContentBlurb.text = passedContentBlurb
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
