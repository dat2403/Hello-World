//
//  ListEx02.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct ListEx02: View {
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafelatte, piccolo and many more. Come over and enjoy a great meal.", phone: "232-923423", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei", description: "A little gem hidden at the corner of the street is nothing butfantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", phone: "348-233423", isFavorite: false),
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
