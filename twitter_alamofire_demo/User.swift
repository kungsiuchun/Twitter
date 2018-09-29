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
    var name: String
    var screenName: String
    var imageURL: String
    //...
    var dict: [String: Any]?
    // Add any additional properties here
    
    init(dictionary: [String: Any]) {
        self.dict = dictionary
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as! String
        let image = dictionary["profile_image_url_https"]as! String
        imageURL = String((image.dropLast(11))) + ".jpg"
        //...
        // Initialize any other properties
      
    }
    
    private static var _current: User?
    
    static var current: User? {
        get{
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userDate = defaults.data(forKey: "currentUserData"){
                    let dict = try! JSONSerialization.jsonObject(with: userDate, options: []) as! [String: Any]
                    _current = User(dictionary: dict)
                }
            }
            return _current
        }
        
        set(user){
            _current = current
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dict!, options: [])
                defaults.set(data, forKey: "currentUserData")
            }else{
                defaults.removeObject(forKey: "currentUserData")
            }
        }
        
    }
    
    
}
