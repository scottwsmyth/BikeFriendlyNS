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
    var blogPostArray: NSArray = NSArray()
    
    @IBAction func mapBtnPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        vc?.feedItems = self.feedItems
        vc?.blogPostArray = self.blogPostArray
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem?.tintColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        var buttonName = ""
        
        switch (indexPath.row) {
            
        case 0:
            buttonName = "about"
        case 1:
            buttonName = "book"
        case 2:
            buttonName = "howToUse"
        case 3:
            buttonName = "FAQ"
        case 4:
            buttonName = "feedback"
        case 5:
            buttonName = "news"
        case 6:
            buttonName = "subscribe"
        default:
            print("There has been an error")
        }
        
        //Conditionals to see what cell was pressed then present corresponding view controller.
        
        if buttonName == "about"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        else if buttonName == "subscribe"{
            showMembersipAlert()
        }
        
        else if buttonName == "feedback"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if buttonName == "news"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "NewsTableViewController") as! NewsTableViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if buttonName == "book"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if buttonName == "FAQ"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyBoard.instantiateViewController(withIdentifier: "HowToUseViewController") as! HowToUseViewController
            
            vc.blogPostArray = self.blogPostArray
            
            vc.feedItems = self.feedItems
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func showMembersipAlert(){
        let alert = UIAlertController(title: "", message: "Would you like to sign up for a membership with Bicycle Nova Scotia?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
            self.redirectToBNS()
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func redirectToBNS(){
        
        guard let link = URL(string: "http://www.bicycle.ns.ca/membership") else { return  }
        
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
        
    }
}
