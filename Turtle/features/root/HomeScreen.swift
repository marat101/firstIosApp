//
//  HomeScreen.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import SwiftUI

struct HomeScreen: View {
    var groups: ViewBuilder
    var teachers: ViewBuilder
    
    var body: some View {
        NavigationView(content: {
            TabView {
                groups.view
                teachers.view
                Additional()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        })
    }
}
