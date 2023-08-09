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

    func getScheduleList() async throws -> [String]? {
        let data: Groups? = try await request(path: "schedule/list")
        return self.isGroup ? data?.group : data?.teacher
    }
    
    func getLastName() -> String? {
        return settings.getLastName()
    }
    
    func setLastName(name: String) {
        return settings.setLastName(name: name)
    }
}
