//
//  ViewController.swift
//  BIkeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit
import SwiftSoup

class HomeViewController: UIViewController, JSONParserLocationsProtocol {
 
   var imageArray: [String] = ["backgroundImage1.jpg","backgroundImage2.jpg","backgroundImage3.jpg","backgroundImage4.jpg","backgroundImage5.jpg"]

    var feedItems: NSArray = NSArray()
    
    func itemsDownloadedLocations(items: NSArray) {
        feedItems = items
    }

    @IBAction func beginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self) //Segue from welcome screen to the MapViewController
    }
    
    @IBOutlet weak var beginButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number = Int.random(in: 0 ..< 5)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageArray[number])
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        beginButton.isEnabled = false
        
        let jsonParser = JSONParserLocations()
        jsonParser.delegate = self
        jsonParser.downloadItems()
        
        //******TO-DO: FIND A WAY TO WAIT FOR DOWNLOAD.ITEMS TO FINISH BEFORE MOVING FORWARD. USING STATIC AMOUNT OF TIME ATM.******
        
        
        //'Load' while data is being fetched from database
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
          self.beginButton.isEnabled = true
          self.beginButton.setTitle("Begin", for: .normal)
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        
        let vc = nav.topViewController as! MapViewController
        
        vc.feedItems = self.feedItems
    }


}

