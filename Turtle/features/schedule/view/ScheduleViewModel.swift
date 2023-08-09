//
//  ScheduleViewModel.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 25.07.2023.
//

import Foundation

class ScheduleViewModel: ObservableObject {
    
    @Published private(set) var days: DaysList? = nil
    @Published private(set) var name: String
    private let repo = ScheduleRepository(isGroup: true) //TODO:
    
    init(name: String) {
        self.name = name
    }
    @MainActor func loadData() {
        Task.init(operation: {
            do {days = try await repo.getSchedule()?.first ?? nil}
        })
    }
}
