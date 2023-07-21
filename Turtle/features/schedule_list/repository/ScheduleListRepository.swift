//
//  SchedulesListRepository.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

class ScheduleListRepository: NetworkDataSource {
    
    let isGroup: Bool
    init(isGroup: Bool) {
        self.isGroup = isGroup
    }
    
    func getScheduleList(task: @escaping ([String]?) -> Void) {
        request(path: "schedule/list",task: { (data: Groups?) -> Void in
            task(self.isGroup ? data?.group : data?.teacher)
        })
    }
}
