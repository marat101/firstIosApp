//
//  Navigator.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import Foundation

protocol NavigationState: Navigator {
    var state: Route { get set }
}

protocol Navigator {
    
    func navigateToSchedule(name: String)
}

final class NavigatorImpl: NavigationState {
    @Published var state: Route = .HomeScreen
    
    func navigateToSchedule(name: String) {
        state = .ScheduleScreen
    }
}
