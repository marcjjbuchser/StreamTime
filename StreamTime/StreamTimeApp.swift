//
//  StreamTimeApp.swift
//  StreamTime
//
//  Created by Marc Buchser on 2024-11-25.
//

import SwiftUI

@main
struct StreamTimeApp: App {
    init() {
        // Customize the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.darkGray // Set the background color to dark gray
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Set large title text color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
