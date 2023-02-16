//
//  StackExercise.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct StackExercise: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass;
    
    var body: some View {
        VStack(spacing: 20){
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("Get help from experts in 15 minutes")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            HStack(alignment: .bottom, spacing: 20) {
                Image("tutor")
                    .resizable()
                    .scaledToFit()
                Image("student")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal, 40)
            
            Text("Need help with coding problems? Register!")
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
            if verticalSizeClass == .compact {
                HSignUpButtonGroup()
            } else {
                VSignUpButtonGroup()
            }  
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            Image("background")
                .resizable()
                .ignoresSafeArea()
//                .scaledToFill()
        }
    }
}

struct StackExercise_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StackExercise()
            
            StackExercise()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
