//
//  BottomNavigationView.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 23.07.2023.
//

import SwiftUI

struct BottomNavigationView: View {
    
    @Binding var selection: Int
    let buttons: [NavigationButton]
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(buttons.indices){ index in
                VStack(alignment: .center) {
                    Button(action: {
                        selection = index+1
                    }) {
                        VStack{
                            let color = selection == index+1 ? theme.colorScheme.navButtonEnabled : theme.colorScheme.navButtonDisabled

                            Spacer().frame(height: 11)
                            Image(buttons[index].imagePath).renderingMode(.template).foregroundColor(color)
                            Text(buttons[index].title).font(Font.qanelas(size: 12)).frame(width: 86).foregroundColor(color)
                        }
                    }
                }
                Spacer()
            }
        }.frame(height: 60)
            .background(
                LinearGradient(
                    colors: theme.colorScheme.bottomBarBackground,
                    startPoint: .leading,
                    endPoint: .trailing).edgesIgnoringSafeArea(.bottom)
            )
    }
}
