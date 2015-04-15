//
//  Data.swift
//  iTunesSearch
//
//  Created by Yusuf UZAN on 15/04/15.
//  Copyright (c) 2015 hx0a1q. All rights reserved.
//

import Foundation

class Data: NSObject{
    
    var appName:String
    var appImageUrl:String
    var authorName:String
    var item:NSDictionary
    
    init(getAppName: String, getAppImageUrl: String, getAuthorName:String, item: NSDictionary){
    
        self.appName = getAppName
        self.appImageUrl = getAppImageUrl
        self.authorName = getAuthorName
        self.item = item
        super.init()
    }
    
    override var description:String{
        return "Oluşturulan data model :\n Uygulama adı: \(appName)\n Uygulama ImageUrl :\(appImageUrl)\n ve Uygulama yazarı : \(authorName)\n"
    }
    
}