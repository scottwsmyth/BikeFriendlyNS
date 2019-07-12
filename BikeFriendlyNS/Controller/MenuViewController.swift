//
//  MenuViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-11.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var feedItems: NSArray = NSArray()
    
    @IBAction func mapBtnPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MenuToMapSegue") as? MapViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        
        let vc = nav.topViewController as! MapViewController
        
        vc.feedItems = self.feedItems
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        var buttonName = ""
        
        switch (indexPath.row) {
            
        case 0:
            buttonName = "about"
        case 1:
            buttonName = "howToUse"
        case 2:
            buttonName = "FAQ"
        case 3:
            buttonName = "feedback"
        case 4:
            buttonName = "subscribe"
        default:
            print("There has been an error")
        }
        
        if buttonName == "about"{
            print("SUP BRU")
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let aboutVC = storyBoard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            
            aboutVC.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(aboutVC, animated: true)
        }
        
    }
}
