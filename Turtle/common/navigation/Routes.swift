//
//  Routes.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import Foundation

enum Route {
    case ScheduleScreen(name: String)
    case HomeScreen
    
    var tag: String {
        switch self {
        case .HomeScreen: return "home"
        case .ScheduleScreen: return "schedule"
        }
    }
}
