//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by XiaoQian Huang on 9/27/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    // TODO: Add properties
    
    // TODO: Create initializer
    
    
    
    
    // MARK: Properties
    var name: String?
    var screenName: String?
    
    //...
    // Add any additional properties here
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        //...
        // Initialize any other properties
      
    }
    static var current: User?
    
    
}
