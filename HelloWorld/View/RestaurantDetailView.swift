//
//  RestaurantDetailView.swift
//  HelloWorld
//
//  Created by Robert Hoang on 17/02/2023.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor(restaurant.isFavorite ? .pink : .white)
                                .padding(.top, 40)
                                .onTapGesture {
                                    
                                }
                             
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.system(.largeTitle))
                                    .bold()
                                
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .background(.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            .foregroundColor(.white)
                            .padding()
                        }
                    }
                Text(restaurant.description)
                    .padding()
                
                HStack(alignment: .top, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("PHONE")
                            .font(.system(.headline, design: .rounded))
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                    }

                }
            }
        }
        .ignoresSafeArea()
       
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei", description: "A little gem hidden at the corner of the street is nothing butfantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specialties including lattes, cappuccinos, teas, and more. We serve breakfast, lunch, and dinner in an airy open setting. Come over, have a coffee and enjoy a chit-chat with our baristas.", phone: "348-233423", isFavorite: false))
    }
}
