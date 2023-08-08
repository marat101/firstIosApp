//
//  Topbar.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 23.07.2023.
//

import SwiftUI

struct CustomTopbar: View {
    
    @EnvironmentObject var theme: ThemeState
    var title: String
    var onBackClick: (() -> Void)?
    
    var body: some View {
        HStack(content: {
            if let click = onBackClick {
                Image("chevron.left")
                    .renderingMode(.template)
                    .foregroundColor(theme.colorScheme.topBarTitle)
                    .frame(width: 20, height: 30)
                    .onTapGesture {
                        click()
                    }
            }
            Text(title)
                .font(.qanelas(size: 32))
                .foregroundColor(theme.colorScheme.topBarTitle)
            Spacer()
            Button(
                action: { theme.setTheme(isDark: !theme.isDark) },
                label: {Image(theme.colorScheme.topBarThemeImage).frame(height: 30)})
        })
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 60,
              maxHeight: 60,
              alignment: .center
        ).padding(.horizontal, 16)
        .background(
            LinearGradient(
                colors: theme.colorScheme.topBarColors,
                startPoint: .leading,
                endPoint: .trailing
            ).edgesIgnoringSafeArea(.top))
        .navigationBarBackButtonHidden(true)
    }
}
