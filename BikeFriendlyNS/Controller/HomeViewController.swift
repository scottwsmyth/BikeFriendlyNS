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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonParser = JSONParser()
        jsonParser.delegate = self
        jsonParser.downloadItems()
        
        //let item: Company = feedItems[0] as! Company
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        
        let vc = nav.topViewController as! MapViewController
        
        vc.feedItems = self.feedItems
    }


}

