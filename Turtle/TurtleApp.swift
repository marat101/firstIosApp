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
    
    @StateObject var theme: ThemeState = ThemeState()
    let rootComponent: RootComponent
    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: theme.colorScheme.topBarTitle], for: .selected)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                
                VStack(content: {
                    
                    NavigationLink(
                        destination: rootComponent.scheduleComponent.view.environmentObject(theme),
                        tag: "aaa",
                        selection: $theme.route) { EmptyView() }
                    
                    rootComponent.homeScreen
                        .environmentObject(theme)
                        .preferredColorScheme(.dark)
                        .background(TurtlesBackground())
                })
               

            }).environmentObject(theme)
        }
    }
}
