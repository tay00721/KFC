//
//  User.swift
//  KFC1
//
//  Created by Mac on 2/5/2563 BE.
//  Copyright © 2563 Mac. All rights reserved.
//

import Foundation

class User {
    var name: String
    var password: String
    var email: String
    
    init (name:String,
          password:String,
          email:String){
        self.name = name
        self.email = email
        self.password = password
    }
}
