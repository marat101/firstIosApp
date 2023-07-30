//
//  ScheduleComponent.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import Foundation
import SwiftUI
import NeedleFoundation

final class ScheduleComponent: Component<EmptyDependency>, ViewBuilder {
    
    var viewModel: some ScheduleViewModel {
        ScheduleViewModelImpl(name: "")
    }
    
    var view: AnyView {
        AnyView(
            Schedule(viewModel: self.viewModel)
        )
    }
}
