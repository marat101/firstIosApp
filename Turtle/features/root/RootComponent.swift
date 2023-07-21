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
    
    var groupsComponent: SchedulesListComponent {
        return SchedulesListComponent(parent: self)
    }
    
    var homeScreen: some View {
        HomeScreen(gvm: groupsComponent.scheduleListViewModel)
    }
}
