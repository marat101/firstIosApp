//
//  TurtlesBackground.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 22.07.2023.
//

import SwiftUI

struct TurtlesBackground: View {
    
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        ZStack {
            gradient
            Image("turtle_right")
                .renderingMode(.template)
                .colorMultiply(theme.colorScheme.backgroundTurtle)
                .frame(width: 49, height: 27, alignment: .bottom)
        }
    }
    
    var gradient: some View {
        LinearGradient(
            gradient: .init(colors: theme.colorScheme.backgroundColors),
            startPoint: .top,
            endPoint: .bottom
        ).edgesIgnoringSafeArea(.all)
    }
}
