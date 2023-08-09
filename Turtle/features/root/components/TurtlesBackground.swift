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
        ZStack(alignment: .center) {
            gradient
            Image("turtle_left")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .colorMultiply(theme.colorScheme.backgroundTurtle)
                .frame(maxWidth: 69, maxHeight: .infinity, alignment: .top)
                .padding(.top, 53)
                .padding(.trailing, 50)
            VStack {
                Image("turtle_left")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .colorMultiply(theme.colorScheme.backgroundTurtle)
                    .frame(maxWidth: .infinity, maxHeight: 29, alignment: .leading)
                    .padding(.top, 132)
                    .padding(.leading, 22)
                
                Spacer()
            }
            VStack {
                Image("turtle_right")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .colorMultiply(theme.colorScheme.backgroundTurtle)
                    .frame(maxWidth: .infinity, maxHeight: 25, alignment: .trailing)
                    .padding(.top, 120)
                    .padding(.trailing, 22)
                Spacer()
            }
            Image("turtle_right")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .colorMultiply(theme.colorScheme.backgroundTurtle)
                .frame(maxWidth: 49, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 72)
                .padding(.trailing, 50)
            VStack {
                Spacer()
                Image("turtle_right")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .colorMultiply(theme.colorScheme.backgroundTurtle)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.bottom, 120)
                    .padding(.leading, 23)
            }
            Image("turtle_right")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .colorMultiply(theme.colorScheme.backgroundTurtle)
                .frame(maxWidth: 65, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 160)
            
            VStack {
                Spacer()
                Image("turtle_left")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .colorMultiply(theme.colorScheme.backgroundTurtle)
                    .frame(maxWidth: .infinity, maxHeight: 47, alignment: .trailing)
                    .padding(.bottom, 100)
                    .padding(.trailing, 23)
            }
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
