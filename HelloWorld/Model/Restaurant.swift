//
//  Restaurant.swift
//  HelloWorld
//
//  Created by Robert Hoang on 17/02/2023.
//

import Foundation
import SwiftUI


class Restaurant : ObservableObject {
    @Published var name: String
    @Published var type: String
    @Published var location: String
    @Published var image: String
    @Published var description: String
    @Published var phone: String
    @Published var isFavorite: Bool = false
    @Published var rating: Rating?
    init(name: String, type: String, location: String, image: String, description: String, phone: String,
         isFavorite: Bool,
         rating: Rating? = nil) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
        self.description = description
        self.phone = phone
        self.rating = rating
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
