//
//  LocalDataSource.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 08.08.2023.
//

import Foundation

class SettingsService {
    let isGroup: Bool
    
    init(isGroup: Bool = true) {
        self.isGroup = isGroup
    }
    
    private let theme_key = "theme"
    private let group_key = "group"
    private let teacher_key = "teacher"
    
    func getLastName() -> String? {
        return UserDefaults.standard.string(forKey: isGroup ? group_key : teacher_key) ?? nil
    }
    
    func setLastName(name: String) {
        UserDefaults.standard.setValue(name, forKey: isGroup ? group_key : teacher_key)
    }
    
    func getTheme() -> Bool {
        return UserDefaults.standard.bool(forKey: theme_key)
    }
    
    func setTheme(isDark: Bool){
        UserDefaults.standard.setValue(isDark, forKey: theme_key)
    }
}
