//
//  ViewController.swift
//  BIkeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit
import SwiftSoup

class HomeViewController: UIViewController, JSONParserProtocol {
    
   var imageArray: [String] = ["BackgroundImage1.jpeg","BackgroundImage2.jpeg","BackgroundImage3.jpeg","BackgroundImage4.jpeg","BackgroundImage5.jpeg"]

    var feedItems: NSArray = NSArray()
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
    }

    @IBAction func beginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SecondViewSegue", sender: self) //Segue from welcome screen to the MapViewController
    }
    
    @IBOutlet weak var beginButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WRITE TO FILE
        
//        let fileName = "webContents.html"
//        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
//
        //GET HTML CONTENT
        
        let number = Int.random(in: 0 ..< 5)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: imageArray[number])
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        beginButton.isEnabled = false
        
        let jsonParser = JSONParser()
        jsonParser.delegate = self
        jsonParser.downloadItems()
        
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

