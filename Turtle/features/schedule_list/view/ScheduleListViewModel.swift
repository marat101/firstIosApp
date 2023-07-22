//
//  ScheduleListViewModel.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

protocol ScheduleListViewModel: ObservableObject {
    var schedules: [String]? { get }
    func loadGroups()
}

class ScheduleListViewModelImpl: ScheduleListViewModel {
    
    private let repository: ScheduleListRepository
    @Published var schedules: [String]?
    
    init(_ repository: ScheduleListRepository) {
        self.repository = repository
    }
            
    
    func loadGroups(){
        repository.getScheduleList(task: { data -> Void in
            if let data = data {
                print(data)
                self.schedules = data
            }
        })
    }
}
