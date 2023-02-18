//
//  Restaurant.swift
//  HelloWorld
//
//  Created by Robert Hoang on 17/02/2023.
//

import Foundation
import SwiftUI


struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var description: String
    var phone: String
    var isFavorite: Bool
    var rating: Rating = .awesome
    
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
    
    enum Rating: String, CaseIterable {
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terrible:
                return "angry"
            }
        }
    }
    
}
