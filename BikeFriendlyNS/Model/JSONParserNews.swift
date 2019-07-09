//
//  JSONParserNews.swift
//  BikeFriendlyNS
//
//  Created by Scott Smyth on 2019-07-08.
//  Copyright © 2019 Scott Smyth. All rights reserved.
//

import UIKit

protocol JSONParserNewsProtocol: class{
    
    func itemsDownloadedNews(items: NSArray)
    
}

class JSONParserNews: NSObject, URLSessionDataDelegate {
    
    weak var delegate: JSONParserNewsProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://scottwsmyth.com/service2.php"
    
    func downloadItems(){
        let url: URL = URL(string: urlPath)!
        
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) {(data, response, error) in
            
            if error != nil{
                print("Failed to download data")
            }
            else{
                print("Data downloaded")
                self.parseJSON(data!)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data){
        
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let blogPostArray = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            let blogPost = BlogPost()
            
            if let title = jsonElement["Title"],
                let preview = jsonElement["Post"],
                let image = jsonElement["Image"]{
               
                blogPost.preview = preview as? String
                blogPost.title = title as? String
                blogPost.image = image as? String
                
            }
            
            blogPostArray.add(blogPost)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloadedNews(items: blogPostArray)
            
        })
        
    }
    
}
