//
//  ScheduleListViewModel.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

protocol Name {
    var selected: String? { get }
}

protocol ScheduleListViewModel: Name, ObservableObject {
    var schedules: [String]? { get }
    var isGroup: Bool { get }
    func loadGroups()
    func onNameChange(name: String)
}

class ScheduleListViewModelImpl: ScheduleListViewModel {

    private let repository: ScheduleListRepository
    @Published private(set) var schedules: [String]?
    @Published private(set) var selected: String? = nil
    
    let isGroup: Bool
    
    init(_ repository: ScheduleListRepository, isGroup: Bool) {
        self.repository = repository
        self.isGroup = isGroup
    }
            
    
    func loadGroups(){
        repository.getScheduleList(task: { data -> Void in
            if let data = data {
                print(data)
                self.schedules = data
            }
        })
    }
    func onNameChange(name: String) {
        selected = name
    }
}
