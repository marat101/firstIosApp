//
//  ScheduleListComponent.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import Foundation
import NeedleFoundation
import SwiftUI

final class GroupsListComponent: Component<EmptyDependency>, ViewBuilder {
  
    var repository: ScheduleListRepository = ScheduleListRepository(isGroup: true)
    
    var scheduleListViewModel: ScheduleListViewModelImpl {
        ScheduleListViewModelImpl(repository)
    }
    var view: AnyView {
        AnyView(SchedulesList(scheduleListViewModel: scheduleListViewModel))
    }
}

final class TeachersListComponent: Component<EmptyDependency>, ViewBuilder {
  
    var repository: ScheduleListRepository = ScheduleListRepository(isGroup: false)
    
    var scheduleListViewModel: ScheduleListViewModelImpl {
        ScheduleListViewModelImpl(repository)
    }
    var view: AnyView {
        AnyView(SchedulesList(scheduleListViewModel: scheduleListViewModel))
    }
}
