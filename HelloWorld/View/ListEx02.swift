//
//  ListEx02.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct ListEx02: View {
    @State var restaurants = [
    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:"Hong Kong", image: "cafedeadend", isFavorite: false),
    Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isFavorite: false),
    Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false),
    Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
    Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false),
    Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
    Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false),
    Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
    Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
    Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
    Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
    Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
    Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
    Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false),
    Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
    Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
    Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
]
    
    var body: some View {
        List{
            ForEach(restaurants.indices, id: \.self) {index in
                FullImageRow(restaurant: $restaurants[index])
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

struct FullImageRow: View {
    
    @Binding var restaurant: Restaurant
    
    @State private var showOptions: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .cornerRadius(25)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    Text(restaurant.type)
                        .font(.system(size: 18))
                        .foregroundColor(.primary)
                    Text(restaurant.location)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                Spacer()
                if restaurant.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .padding(.top, 30)
        .confirmationDialog(Text("Oke"), isPresented: $showOptions) {
            Button {
//                showError.toggle()
            } label: {
                Text("Hit me!")
            }
            Button {
                restaurant.isFavorite.toggle()
            } label: {
                if restaurant.isFavorite {
                    Text("Remove from favorites")
                }else {
                    Text("Mark as favorite")
                }
            }
        }
    }
}
