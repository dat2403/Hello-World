//
//  StackDemo.swift
//  HelloWorld
//
//  Created by Robert Hoang on 16/02/2023.
//

import SwiftUI

struct StackDemo: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass;
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                Text("Get help from experts in 15 minutes")
            }
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1")
                    .resizable()
                    .scaledToFit()
                Image("user2")
                    .resizable()
                    .scaledToFit()
                Image("user3")
                    .resizable()
                    .scaledToFit()
            }
            .padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
            
            Spacer()
            if verticalSizeClass == .compact {
                HSignUpButtonGroup()
            } else {
                VSignUpButtonGroup()
            }        }
        .padding(.top, 30)

    }
}

struct StackDemo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StackDemo()
            
            StackDemo()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Button {
                
            } label: {
                Text("Sign up")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .frame(width: 200)
            .padding(.vertical)
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(20)
            
            Button {
                
            } label: {
                Text("Log in")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .frame(width: 200)
            .padding(.vertical)
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(20)
            
        }
    }
}

struct HSignUpButtonGroup: View {
    var body: some View {
        HStack(spacing: 20) {
            Button {
                
            } label: {
                Text("Sign up")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .frame(width: 200)
            .padding(.vertical)
            .foregroundColor(.white)
            .background(.indigo)
            .cornerRadius(20)
            
            Button {
                
            } label: {
                Text("Log in")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
            }
            .frame(width: 200)
            .padding(.vertical)
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(20)
        }
    }
}
