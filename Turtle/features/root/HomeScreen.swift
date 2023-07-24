//
//  HomeScreen.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import SwiftUI

struct NavigationButton {
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
    
    private let buttons = [
        NavigationButton("Группы","navigation_group"),
        NavigationButton("Преподаватели","navigation_teacher"),
        NavigationButton("Дополнительно","navigation_additional")
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
            BottomNavigationView(selection: $selection, buttons: buttons)
            
            
        }
    }
}

