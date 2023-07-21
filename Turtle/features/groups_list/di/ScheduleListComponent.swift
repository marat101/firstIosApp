//
//  ScheduleListComponent.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 19.07.2023.
//

import Foundation
import NeedleFoundation
import SwiftUI

final class SchedulesListComponent: Component<EmptyDependency> {
  
    var repository: SchedulesListRepository = SchedulesListRepository()
    
    var scheduleListViewModel: ScheduleListViewModelImpl {
        ScheduleListViewModelImpl(repository)
    }
    var scheduleListScreen: any View {
        GroupsList(groupsViewModel: scheduleListViewModel)
    }
}

