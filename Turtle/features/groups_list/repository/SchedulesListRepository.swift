//
//  SchedulesListRepository.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

class SchedulesListRepository: BaseNetworkDataSource<Groups> {
    func getSchedules(task: @escaping (Groups?) -> Void) {
        request(path: "schedule/list",task: { data -> Void in
            task(data)
        })
    }
}
