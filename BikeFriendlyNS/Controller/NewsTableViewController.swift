//
//  NewsTableViewController.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-08.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var blogPostArray: NSArray = NSArray()
    
    @IBOutlet var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(blogPostArray)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return blogPostArray.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        print(indexPath.item)
        
        var temp = blogPostArray[indexPath.item] as! BlogPost
        
        let mySubstring = String(temp.preview!.prefix(175)) // Hello
        
        cell.currentTitle.text = temp.title
        cell.currentPreview.text = ("\(mySubstring)... \n\nRead more")
        
        print(mySubstring)
        
        if UIImage(named: temp.image as! String) != nil{
            cell.currentImage.image = UIImage(named: temp.image as! String)
        }
        else{
            cell.currentImage.image = UIImage(named: "BNS_Man.png")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }


}
