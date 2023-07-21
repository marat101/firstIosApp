//
//  HomeScreen.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import SwiftUI

struct HomeScreen<GVM: ScheduleListViewModel>: View {
    var gvm: GVM
    
    var body: some View {
        NavigationView(content: {
            TabView {
                GroupsList(groupsViewModel: gvm)
                TeachersList()
                Additional()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        })
    }
}
