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
    
//    var groups: GroupsListComponent
//    var teachers: TeachersListComponent
    @State var selection = 1
    @EnvironmentObject var theme: ThemeState
    
    private let buttons = [
        NavigationButton("Группы","navigation_group"),
        NavigationButton("Преподаватели","navigation_teacher"),
        NavigationButton("Дополнительно","navigation_additional")
    ]
    
    var body: some View {
        VStack {
            LinearGradient(
                colors: theme.colorScheme.topBarColors,
                startPoint: .leading,
                endPoint: .trailing
            ).edgesIgnoringSafeArea(.top)
                .frame(height: 0)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("TurtleApp")
                            .font(.qanelas(size: 32))
                            .foregroundColor(theme.colorScheme.topBarTitle)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(
                            action: {
                                theme.setTheme( theme: theme.isDark ? Theme.light : Theme.dark)
                            }
                        ){
                            Image(!theme.isDark ? "moon" : "sun").frame(width: 30, height: 30)
                        }}
                })
            
            TabView(selection: $selection) {
                SchedulesList<ScheduleListViewModelImpl>(scheduleListViewModel: ScheduleListViewModelImpl(isGroup: true)).tag(1)
                SchedulesList<ScheduleListViewModelImpl>(scheduleListViewModel: ScheduleListViewModelImpl(isGroup: false)).tag(2)
                Additional().tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.default, value : selection)
            BottomNavigationView(selection: $selection, buttons: buttons)
        }
    }
}

