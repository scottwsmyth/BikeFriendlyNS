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
    
    @IBAction func readMorePressed(_ sender: UIButton) {
        
        let temp = blogPostArray[sender.tag] as! BlogPost
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentViewController") as? NewsContentViewController
        
        vc?.passedTitle = temp.title!
        vc?.passedContentBlurb = temp.preview!
        
        if UIImage(named: temp.image!) != nil{
            vc?.passedImage = temp.image!
        }
        else{
            vc?.passedImage = "BNS_Man.png"
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
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
        
        cell.readMoreBtn.tag = indexPath.row;
        
        let temp = blogPostArray[indexPath.item] as! BlogPost
        
        let mySubstring = String(temp.preview!.prefix(175))
        
        cell.currentTitle.text = temp.title
        cell.currentPreview.text = ("\(mySubstring)...")
        cell.currentPreview.setContentOffset(CGPoint.zero, animated: false)

        
        if UIImage(named: temp.image!) != nil{
            cell.currentImage.image = UIImage(named: temp.image!)
        }
        else{
            cell.currentImage.image = UIImage(named: "BNS_Man.png")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let temp = blogPostArray[indexPath.item] as! BlogPost
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentViewController") as? NewsContentViewController
        
        vc?.passedTitle = temp.title!
        vc?.passedContentBlurb = temp.preview!
        
        if UIImage(named: temp.image!) != nil{
            vc?.passedImage = temp.image!
        }
        else{
            vc?.passedImage = "BNS_Man.png"
        }
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
