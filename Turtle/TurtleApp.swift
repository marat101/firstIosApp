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
    
    let rootComponent: RootComponent
    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
    }
    
    var body: some Scene {
        WindowGroup {
            rootComponent.homeScreen
        }
    }
}
