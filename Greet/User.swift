//
//  User.swift
//  Greet
//
//  Created by Sarah Raines on 4/5/19.
//  Copyright © 2019 Sarah Raines. All rights reserved.
//

import Foundation

class User: NSObject {
    var uid : String = ""
    var name : String = ""
    var email : String = ""
    
    init(uid : String,
         name : String,
         email : String) {
        self.uid = uid
        self.name = name
        self.email = email
    }
    
    func toFIRObject() -> Any {
        return [
            "uid" : uid,
            "name" : name,
            "email" : email,
        ]
    }
    
}
