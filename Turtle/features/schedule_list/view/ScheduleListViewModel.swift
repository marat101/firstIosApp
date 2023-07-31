//
//  ScheduleListViewModel.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation
import Combine

protocol ScheduleListViewModel: ObservableObject {
    var selected: String { get }
    var schedules: [String]? { get }
    var isGroup: Bool { get }
    func loadGroups()
    func onNameChange(name: String)
}

class ScheduleListViewModelImpl: ScheduleListViewModel {
   
    private let repository: ScheduleListRepository
    
    @Published private(set) var schedules: [String]?
    @Published private(set) var selected: String = "Выбрать"

    let isGroup: Bool
    
    init(isGroup: Bool) {
        self.repository = ScheduleListRepository(isGroup: isGroup)
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
