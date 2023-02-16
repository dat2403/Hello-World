//
//  ListEx02.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct ListEx02: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House","Austrian/ Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var body: some View {
        List{
            ForEach(restaurantNames.indices, id: \.self) {index in
                VStack(alignment: .leading) {
                    Image(restaurantImages[index])
                        .resizable()
                        .frame(width: .infinity, height: 250)
                        .cornerRadius(25)
                    
                    VStack(alignment: .leading) {
                        Text(restaurantNames[index])
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        Text(restaurantTypes[index])
                            .font(.system(size: 18))
                            .foregroundColor(.primary)
                        Text(restaurantLocations[index])
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ListEx02_Previews: PreviewProvider {
    static var previews: some View {
        ListEx02()
    }
}
