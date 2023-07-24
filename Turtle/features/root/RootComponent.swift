//
//  RootComponent.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import Foundation
import NeedleFoundation
import SwiftUI

final class RootComponent: BootstrapComponent {
        
    var groupsComponent: GroupsListComponent {
        return GroupsListComponent(parent: self)
    }
    
    var teachersComponent: TeachersListComponent {
        return TeachersListComponent(parent: self)
    }
    
    var navigation: NavigationState {
        return NavigatorImpl()
    }
    
    var homeScreen: some View {
        HomeScreen(groups: groupsComponent, teachers: teachersComponent)
    }
}
