//
//  Restaurant.swift
//  HelloWorld
//
//  Created by Robert Hoang on 17/02/2023.
//

import Foundation


struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var description: String
    var phone: String
    var isFavorite: Bool
    
    init(name: String, type: String, location: String, image: String, description: String, phone: String, isFavorite: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
        self.description = description
        self.phone = phone
    }
    
    init() {
        self.init(name: "", type: "", location: "", image: "", description: "", phone: "", isFavorite: false)
    }
    
}
