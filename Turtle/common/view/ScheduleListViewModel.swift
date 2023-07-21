//
//  ScheduleListViewModel.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

protocol ScheduleListViewModel: ObservableObject {
    var schedules: Groups { get }
    func loadGroups()
}

class ScheduleListViewModelImpl: ScheduleListViewModel {

    private let repository: SchedulesListRepository
    @Published var schedules: Groups = Groups(group: [], teacher: [])
    
    init(_ repository: SchedulesListRepository) {
        self.repository = repository
    }
            
    
    func loadGroups(){
        repository.getSchedules(task: { data -> Void in
            if let data = data {
                print(data)
                self.schedules = data
            }
        })
    }
}
