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
    init() {
        registerProviderFactories()
        self.rootComponent = RootComponent()
    }
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    LinearGradient(
                        colors: themeState.colorScheme.topBarColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    ).edgesIgnoringSafeArea(.top)
                        .frame(height: 0)
                    ZStack {
                        LinearGradient(
                            colors: themeState.colorScheme.topBarColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        HStack {
                            Text("TurtleApp")
                            Spacer()
                            Button(
                                action: {
                                    themeState.setTheme(
                                        theme: themeState.theme == Theme.dark ? Theme.light : Theme.dark)
                                }
                            ){
                                Image(themeState.theme == .light ? "moon" : "sun").frame(width: 30, height: 30)
                            }
                        }.padding(.horizontal, 16)
                    }.frame(height: 60)
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
}
