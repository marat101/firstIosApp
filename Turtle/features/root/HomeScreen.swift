//
//  HomeScreen.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import SwiftUI

private struct NavigationButton {
    let title: String
    let imagePath: String
    init(_ title: String, _ imagePath: String) {
        self.title = title
        self.imagePath = imagePath
    }
}

struct HomeScreen: View {
    
    var groups: ViewBuilder
    var teachers: ViewBuilder
    @State var selection = 1
    @EnvironmentObject var themeManager: ThemeState
    
    private let buttons = [
        NavigationButton("Группы",""),
        NavigationButton("Преподаватели",""),
        NavigationButton("Дополнительно","")
    ]
    
    init(groups: ViewBuilder, teachers: ViewBuilder) {
        self.groups = groups
        self.teachers = teachers
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                groups.view.tag(1)
                teachers.view.tag(2)
                Additional().tag(3)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.default, value : selection)

            HStack {
                ForEach(buttons.indices){ index in
                    VStack {
                        Button(buttons[index].title, action: {
                            selection = index+1
                            themeManager.setTheme(theme: themeManager.theme == Theme.dark ? Theme.light : Theme.dark)
                        })
                    }
                }
            }
        }
    }
}

