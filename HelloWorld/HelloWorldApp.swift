//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by Robert Hoang on 11/02/2023.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor:
                                                        UIColor(named: "NavigationBarTitle") ?? .systemRed,
                                                        .font: UIFont(name: "ArialRoundedMTBold",size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor:
                                                    UIColor(named: "NavigationBarTitle") ?? .systemRed,
                                                    .font: UIFont(name: "ArialRoundedMTBold", size:20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            ListEx02()
            CustomList()
        }
    }
}
