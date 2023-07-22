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
    
    let themeState: ThemeState
    @Environment(\.colorScheme) var currentTheme
    let rootComponent: RootComponent
    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
        themeState = ThemeState()
        themeState.setTheme(theme: currentTheme == .dark ? Theme.dark.colorScheme : Theme.light.colorScheme)
    }
    
    var body: some Scene {
        WindowGroup {
            rootComponent.homeScreen.environmentObject(themeState)
        }
    }
}
