//
//  ViewController.swift
//  BIkeFriendlyNS
//
//  Created by Scott Smyth on 2019-06-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, JSONParserProtocol {
    
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

