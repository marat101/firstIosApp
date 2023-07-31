//
//  TurtleApp.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 20.07.2023.
//

import SwiftUI

@main
struct TurtleApp: App {
    
    var theme: ThemeState = ThemeState()
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: theme.colorScheme.topBarTitle], for: .selected)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                HomeScreen()
                    .environmentObject(theme)
                    .preferredColorScheme(.dark)
                    .background(TurtlesBackground())
            }).environmentObject(theme)
        }
    }
}
