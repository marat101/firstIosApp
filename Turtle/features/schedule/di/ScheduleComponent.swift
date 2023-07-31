//
//  ScheduleComponent.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import Foundation
import SwiftUI
import NeedleFoundation

final class ScheduleComponent: Component<EmptyDependency> {
    
    @ViewBuilder func view(name: String) -> some View {
            Schedule(viewModel: ScheduleViewModelImpl(name: name))
    }
}
