//
//  CustomList.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct CustomList: View {
    
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
        List {
            ForEach(restaurants.indices, id: \.self) {index in
                BasicTextImageRow(restaurant: $restaurants[index])
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        .tint(.red)
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .tint(.orange)

                    }
            }
            .onDelete(perform: { indexSet in
                restaurants.remove(atOffsets: indexSet)
            })
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct CustomList_Previews: PreviewProvider {
    static var previews: some View {
        CustomList()
//            .preferredColorScheme(.dark)
    }
}

struct BasicTextImageRow: View {
    
    @State private var showOptions: Bool = false
    @State private var showError: Bool = false
    
//    MARK: - Binding
    
    @Binding var restaurant: Restaurant
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
            }
            
        }
        .contextMenu {
            Button {
                showError.toggle()
            } label: {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            Button {
                restaurant.isFavorite.toggle()
                print("HTD", restaurant.isFavorite)
            } label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites": "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
        }
//        .onTapGesture {
//            showOptions.toggle()
//        }
//        actionSheet is deprecated  => Use confirmationDialog
//        instead!
        .confirmationDialog(Text("Oke"), isPresented: $showOptions) {
            Button {
                showError.toggle()
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
        .alert(Text("Oke!"), isPresented: $showError) {
            Button {
                
            } label: {
                Text("Cancel!")
            }
            Button(action: {
            }) {
                Text("Like!")
            }
        } message: {
            Text("This is an error!")
        }


    }
}
