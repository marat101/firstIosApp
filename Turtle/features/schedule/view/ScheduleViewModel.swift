//
//  ScheduleViewModel.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 25.07.2023.
//

import Foundation

protocol ScheduleViewModel: ObservableObject {
    var name: String { get }
}

class ScheduleViewModelImpl : ScheduleViewModel {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
