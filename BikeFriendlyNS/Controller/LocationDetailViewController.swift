//
//  LocationDetailController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-17.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    
    //Button IBAction which opens the current company's facebook URL when the icon is tapped on the storyboard.
    
    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        popUp()
        
//        guard let link = URL(string: facebookURL) else { return  }
//
//        UIApplication.shared.open(link, options: [:], completionHandler: nil)
        
    }
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var currentDescrip: UITextView!
    @IBOutlet weak var currentAddress: UITextView!
    @IBOutlet weak var currentPhone: UITextView!
    
    var facebookURL: String = ""
    var passedImg = UIImage()
    var passedTitle: String = ""
    var passedDescription: String = ""
    var passedAddress: String = ""
    var passedPhone: String = ""
    
    //Set properties to passed ones from previous controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentImage.image = passedImg
        currentLabel.text = passedTitle
        currentDescrip.text = passedDescription
        currentAddress.text = passedAddress
        currentPhone.text = passedPhone
    }
    
    func popUp(){
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
}
