//
//  ScheduleComponent.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import Foundation
import SwiftUI
import NeedleFoundation

protocol ScheduleDeps: Dependency {
    var name: Name { get }
}

final class ScheduleComponent: Component<ScheduleDeps>, ViewBuilder {
    
    var view: AnyView {
        AnyView(
            Schedule(name: dependency.name.selected ?? "blya")
        )
    }
}
