//
//  ListExample.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct ListExample: View {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var body: some View {
        List {
//            ForEach(1...4, id: \.self) { index in
//                Text("item \(index)")
//            }
            ForEach(restaurantNames, id: \.self) { restaurant in
                HStack {
                    Image("user1")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(restaurant)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}
