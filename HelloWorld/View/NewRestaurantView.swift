//
//  NewRestaurantView.swift
//  HelloWorld
//
//  Created by Robert Hoang on 20/02/2023.
//

import SwiftUI

enum PhotoSource: Identifiable {
    case photoLibrary
    case camera
    var id: Int {
        hashValue
    } }

struct NewRestaurantView: View {
    
    @State var restaurantName: String = ""
    @State var restaurantType: String = ""
    @State var restaurantLocation: String = ""
    @State var restaurantPhone: String = ""
    @State var restaurantDescription: String = ""
    @State var restaurantImage: UIImage = UIImage(named: "newphoto")!
    
    @State var showPhotoOptions: Bool = false
    
    
    
    @State private var photoSource: PhotoSource?
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(uiImage: restaurantImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            showPhotoOptions.toggle()
                        }
                    FormTextField(
                        label: "name",
                        placeholder: "Fill in the restaurant name",
                        value: $restaurantName)
                    FormTextField(
                        label: "type",
                        placeholder: "Fill in the restaurant type",
                        value: $restaurantType)
                    FormTextField(
                        label: "address",
                        placeholder: "Fill in the restaurant address",
                        value: $restaurantLocation)
                    FormTextField(
                        label: "phone",
                        placeholder: "Fill in the restaurant phone",
                        value: $restaurantPhone)
                    FormTextField(
                        label: "description",
                        placeholder: "Fill in the restaurant description",
                        value: $restaurantDescription)
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Save")
                }
                
            }
            .font(.headline)
            .foregroundColor(Color("NavigationBarTitle"))
            .confirmationDialog("Choose your photo source", isPresented: $showPhotoOptions) {
                Button {
                    photoSource = .photoLibrary
                } label: {
                    Text("Photo library")
                }
                Button {
                    photoSource = .camera
                } label: {
                    Text("Camera")
                }
            }
            .fullScreenCover(item: $photoSource) { source in
                switch source {
                case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $restaurantImage)
                        .ignoresSafeArea()
                case .camera: ImagePicker(sourceType: .camera, selectedImage: $restaurantImage)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
        
        FormTextField(
            label: "name",
            placeholder: "Fill in the restaurant name",
            value: .constant(""))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}


struct FormTextField: View {
    
    let label: String
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            TextField(placeholder, text: $value)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                }
                .padding(.vertical, 10)
        }
    }
}
