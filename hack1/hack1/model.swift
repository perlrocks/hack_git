//
//  model.swift
//  hack1
//
//  Created by Matt on 9/27/14.
//  Copyright (c) 2014 seamus o cuinneagain. All rights reserved.
//

import Foundation
import CoreLocation

var globalId = 1
func getId() -> Int {
    globalId++
    return globalId
}

class Item {
    var id = getId()
    var name: String
    var description: String
    var cllocation: CLLocation? // Location could be a place or a user
    weak var owner: User?
    
    init(name: String, description: String, location: CLLocation) {
        self.name = name
        self.description = description
        self.cllocation = location
    }
    
    func location() -> CLLocation? {
        if let location = cllocation ?? owner?.location {
            return location
        } else {
            return nil
        }
    }
}

class User {
    var id = getId()
    var name: String
    var items = [Item]()
    var location: CLLocation?
    
    init(name: String) {
        self.name = name
    }
}

