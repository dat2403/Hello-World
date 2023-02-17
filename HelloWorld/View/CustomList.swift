//
//  CustomList.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct CustomList: View {
    
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafelatte, piccolo and many more. Come over and enjoy a great meal.", phone: "232-923423", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei", description: "A little gem hidden at the corner of the street is nothing butfantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", phone: "348-233423", isFavorite: false),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants.indices, id: \.self) {index in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: {
                            RestaurantDetailView(restaurant: restaurants[index])
                        }) {
                            EmptyView()
                        }
                        .opacity(0)
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
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle(Text("FoodPin"))
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(.white)
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
        .sheet(isPresented: $showOptions) {
            let defaultText = "Just checking in at \(restaurant.name)"
            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            } }
        
    }
}
