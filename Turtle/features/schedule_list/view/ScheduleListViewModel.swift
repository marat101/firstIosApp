//
//  ScheduleListViewModel.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation
import Combine

protocol ScheduleListViewModel: ObservableObject {
    var selected: String? { get }
    var schedules: [String]? { get }
    var isGroup: Bool { get }
    var navigate: Bool { get set }
    var toast: String? { get set }
    var search: String { get set }
    func loadGroups()
    func onNameChange(name: String)
    func navigateToSchedule()
}

class ScheduleListViewModelImpl: ScheduleListViewModel {
    private let repository: ScheduleListRepository
    
    @Published private(set) var schedules: [String]?
    @Published private(set) var selected: String? = nil
    @Published var navigate: Bool = false
    @Published var toast: String? = nil
    @Published var search: String = ""
    
    let isGroup: Bool
    
    init(isGroup: Bool) {
        self.repository = ScheduleListRepository(isGroup: isGroup)
        self.isGroup = isGroup
        self.selected = repository.getLastName()
    }
    
    
    @MainActor func loadGroups(){
        Task.init(operation: {
            do {
            let data = try await repository.getScheduleList()
            if let data = data {
                self.schedules = data
            }}
        })
    }
    func onNameChange(name: String) {
        selected = name
        repository.setLastName(name: name)
    }
    func navigateToSchedule() {
        if let _ = selected {
            navigate = true
        } else {
            toast = "Выберите расписание!"
        }
    }
}
