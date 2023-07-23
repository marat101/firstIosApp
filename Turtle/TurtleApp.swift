//
//  TurtleApp.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 20.07.2023.
//

import SwiftUI
import NeedleFoundation

@main
struct TurtleApp: App {
    
    @StateObject var themeState: ThemeState = ThemeState()
    let rootComponent: RootComponent
    @State var topbarTitle = "TurtleApp"
    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
    }
    
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 0) {
                Topbar(title: $topbarTitle).environmentObject(themeState)
                NavigationView(content: {
                    rootComponent.homeScreen
                        .environmentObject(themeState)
                        .preferredColorScheme(.dark)
                        .background(TurtlesBackground().environmentObject(themeState))
                })
            }
        }
    }
}
