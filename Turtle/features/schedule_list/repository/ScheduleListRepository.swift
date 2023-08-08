//
//  SchedulesListRepository.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

class ScheduleListRepository: NetworkDataSource {
    
    private let isGroup: Bool
    private let settings: SettingsService

    init(isGroup: Bool) {
        self.isGroup = isGroup
        self.settings = SettingsService(isGroup: isGroup)
    }

    func getScheduleList(task: @escaping ([String]?) -> Void) {
        request(path: "schedule/list",task: { (data: Groups?) -> Void in
            task((self.isGroup ? data?.group : data?.teacher) ?? ["ИБА-21", "ИБА-22", "ИБА-23", "ИБА-24", "РТ-21"])
        })
    }
    
    func getLastName() -> String? {
        return settings.getLastName()
    }
    
    func setLastName(name: String) {
        return settings.setLastName(name: name)
    }
}
