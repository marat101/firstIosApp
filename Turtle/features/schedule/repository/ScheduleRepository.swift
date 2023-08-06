//
//  ScheduleRepository.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 06.08.2023.
//

import Foundation

class ScheduleRepository: NetworkDataSource {
    
    let isGroup: Bool
    init(isGroup: Bool) {
        self.isGroup = isGroup
    }
    
    func getSchedule(task: @escaping ([DaysList]?) -> Void) {
        request(path: "schedule",task: { (data: [DaysList]?) -> Void in
            task(data)
        })
    }
}
