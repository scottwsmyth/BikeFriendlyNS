//
//  LocationDetailController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-17.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class LocationDetailController: UIViewController {
    
    
    //Button IBAction which opens the current company's facebook URL when the icon is tapped on the storyboard.
    
    @IBAction func btn_URL(_ sender: Any) {
        
        guard let link = URL(string: passedURL) else { return  }
        
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
        
    }
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var currentDescrip: UITextView!
    @IBOutlet weak var currentDescrip2: UITextView!
    
    var passedURL: String = ""
    var passedImg = UIImage()
    var passedTitle: String = ""
    var passedDescription: String = ""
    var passedDescription2: String = ""
    
    //Set properties to passed ones from previous controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentImage.image = passedImg
        currentLabel.text = passedTitle
        currentDescrip.text = passedDescription
        currentDescrip2.text = passedDescription2
    }
    
}
