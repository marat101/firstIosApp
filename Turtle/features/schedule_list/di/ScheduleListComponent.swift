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
    
    var scheduleListViewModel: some ScheduleListViewModel {
        return shared {
            ScheduleListViewModelImpl(repository, isGroup: true)
        }
    }
    
    var name: Name {
        scheduleListViewModel
    }
    
    var view: AnyView {
        AnyView(SchedulesList(scheduleListViewModel: self.scheduleListViewModel, navigateToSchedule: schedule).navigationBarTitleDisplayMode(.large))
    }
    
    var schedule: ScheduleComponent {
        return ScheduleComponent(parent: self)
    }
}

final class TeachersListComponent: Component<EmptyDependency>, ViewBuilder {
  
    var repository: ScheduleListRepository = ScheduleListRepository(isGroup: false)
    
    var scheduleListViewModel: some ScheduleListViewModel {
        return shared {
            ScheduleListViewModelImpl(repository, isGroup: false)
        }
    }
    
    var name: Name {
        scheduleListViewModel
    }
    
    var view: AnyView {
        AnyView(SchedulesList(scheduleListViewModel: self.scheduleListViewModel, navigateToSchedule: schedule))
    }
    
    var schedule: ScheduleComponent {
        return ScheduleComponent(parent: self)
    }
}
