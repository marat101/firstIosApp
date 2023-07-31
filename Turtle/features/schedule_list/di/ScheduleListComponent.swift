//
//  ScheduleListComponent.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import Foundation
import NeedleFoundation
import SwiftUI

final class GroupsListComponent: Component<EmptyDependency> {
    
    var repository: ScheduleListRepository = ScheduleListRepository(isGroup: true)
    
    var scheduleListViewModel: some ScheduleListViewModel {
        return shared {
            ScheduleListViewModelImpl(repository, isGroup: true)
        }
    }
    
    var name: Name {
        scheduleListViewModel
    }
    
    @ViewBuilder func view() -> some View {
        SchedulesList(scheduleListViewModel: self.scheduleListViewModel).navigationBarTitleDisplayMode(.large)
    }
}

final class TeachersListComponent: Component<EmptyDependency> {
  
    var repository: ScheduleListRepository = ScheduleListRepository(isGroup: false)
    
    var scheduleListViewModel: some ScheduleListViewModel {
        return shared {
            ScheduleListViewModelImpl(repository, isGroup: false)
        }
    }
    
    var name: Name {
        scheduleListViewModel
    }
    
    @ViewBuilder func view() -> some View {
        SchedulesList(scheduleListViewModel: self.scheduleListViewModel)
    }
}
