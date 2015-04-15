//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Yusuf UZAN on 15/04/15.
//  Copyright (c) 2015 hx0a1q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let searchTerm = "Yusuf UZAN"
        if let replacedSearchTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding){
            let searchString = "https://itunes.apple.com/search?term=\(replacedSearchTerm)&entity=software"
            if let url = NSURL(string: searchString){
            
                let session = NSURLSession.sharedSession()
                let task = session.dataTaskWithURL(url, completionHandler: { (urlData: NSData!, urlResponse: NSURLResponse!, error: NSError!) -> Void in
                    
                    if error == nil{
                        var jsonError:NSError?
                        if let jsonDict = NSJSONSerialization.JSONObjectWithData(urlData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary{
                            if let restulsArray = jsonDict["results"] as? NSArray{
                            
                                var arrayData = [Data]()
                                for item in restulsArray{
                                    if let artistName = item["artistName"] as? NSString{
                                        if let appName = item["trackCensoredName"] as? NSString{
                                            
                                            if let appImageUrl = item["artworkUrl60"] as? NSString{
                                                
                                                var dataObject = Data(getAppName: appName as String, getAppImageUrl: appImageUrl as String, getAuthorName: artistName as String)
                                                
                                                println(dataObject.description)
                                                self.dataArray.append(dataObject)
                                                }
                                            }
                                        }
                                    }
                                    dispatch_async(dispatch_get_main_queue()){
                                    self.dataArray = arrayData
                                    
                                }
                            }
                        }
                    }
                })
                task.resume()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

