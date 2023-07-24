//
//  Topbar.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 23.07.2023.
//

import SwiftUI

struct Topbar: View {
    
    @EnvironmentObject var themeState: ThemeState
    @Binding var title: String
    
    var body: some View {
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
                Text(title)
                    .font(Font.qanelas(size: 24))
                    .foregroundColor(themeState.colorScheme.topBarTitle)
                Spacer()
                Button(
                    action: {
                        themeState.setTheme( theme: themeState.isDark ? Theme.light : Theme.dark)
                    }
                ){
                    Image(!themeState.isDark ? "moon" : "sun").frame(width: 30, height: 30)
                }
            }.padding(.horizontal, 16)
        }.frame(height: 60)
    }
}
