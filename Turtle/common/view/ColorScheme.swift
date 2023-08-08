//
//  ColorScheme.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 22.07.2023.
//

import Foundation
import SwiftUI

struct ColorScheme {
    let backgroundColors: [Color]
    let backgroundTurtle: Color
    
    let topBarColors: [Color]
    let topBarTitle: Color
    let topBarThemeImage: String
    
    let bottomBarBackground: [Color]
    let navButtonEnabled: Color
    let navButtonDisabled: Color

    let transparentCardBackground: Color
    
    let selectGroupImage: String
    let selectTeacherImage: String
    let selectButtonTurtle: Color
    let selectButtonBackground: Color
    let selectBtnStroke: Color
    let selectBtnText: Color
    let nextBtnBackground: [Color]
    let nextBtnText: Color
    
    let nameItemBackground: Color
    let nameItemText: Color
    
    let dateBakground: Color
    let dateText: Color
    
    let pairBackground: Color
    let pairNumber: Color
    let pairTextColor: Color
    let pairTextSecondColor: Color
    let pairNameBackground: Color
}

enum Theme {
    case light, dark
    
    private static let defaultDarkTheme = ColorScheme(
        backgroundColors: [Color(0x0A192F),Color(0x0A192F)],
        backgroundTurtle: Color(0x464F6B, alpha: 0.85),
        topBarColors: [Color(0x112240),Color(0x112240)],
        topBarTitle: Color(0x8D91D1),
        topBarThemeImage: "sun",
        bottomBarBackground: [Color(0x112240), Color(0x112240)],
        navButtonEnabled: Color(0x8D91D1),
        navButtonDisabled: Color(0x9E9C9F),
        transparentCardBackground: Color(0x464F6B, alpha: 0.85),
        selectGroupImage: "selectgroupnight",
        selectTeacherImage: "selectteachernight",
        selectButtonTurtle: Color(0x313A55),
        selectButtonBackground: Color(0x0A192F, alpha: 0.35),
        selectBtnStroke: Color.clear,
        selectBtnText: Color(0x8D91D1),
        nextBtnBackground: [Color(0x0A192F), Color(0x0A192F)],
        nextBtnText: Color(0x8D91D1),
        nameItemBackground: Color(0x3D4762, alpha: 0.85),
        nameItemText: Color(0x8D91D1),
        dateBakground: Color(0x3D4762),
        dateText: Color(0xCCD6F6),
        pairBackground: Color(0x464F6B, alpha: 0.83),
        pairNumber: .white,
        pairTextColor: Color(0x8D91D1),
        pairTextSecondColor: Color(0xCFCFCF),
        pairNameBackground: Color(0x112240, alpha: 0.35)
    )
    
    private static let defaultLightTheme = ColorScheme(
        backgroundColors: [Color(0xFCFDD7),Color(0xB5E7AB)],
        backgroundTurtle: Color(0x417B65, alpha: 0.28),
        topBarColors: [Color(0x417B65), Color(0xA7CE7B)],
        topBarTitle: Color(0xFFFFFF),
        topBarThemeImage: "moon",
        bottomBarBackground: [Color(0x86C8A7), Color(0xB3E3AE)],
        navButtonEnabled: Color(0xFFFFFF),
        navButtonDisabled: Color(0x575756),
        transparentCardBackground: Color(0xFFFFFF, alpha: 0.76),
        selectGroupImage: "selectgroup",
        selectTeacherImage: "selectteacher",
        selectButtonTurtle: Color(0xE8F0DF),
        selectButtonBackground: Color(0xFFFFFF),
        selectBtnStroke: Color(0x417B65, alpha: 0.35),
        selectBtnText: Color(0x417B65),
        nextBtnBackground: [Color(0x417B65), Color(0xA7CE7B)],
        nextBtnText: Color(0xFFFFFF),
        nameItemBackground: Color(0xFFFFFF),
        nameItemText: Color(0x96D162),
        dateBakground: Color(0xFFF2F6E8),
        dateText: Color(0x417B65),
        pairBackground: Color(0xF5F6F1, alpha: 0.76),
        pairNumber: .white,
        pairTextColor: Color(0x417B65),
        pairTextSecondColor: Color(0x9E9C9F),
        pairNameBackground: Color(0xA7CE7B, alpha: 0.23)
    )
    
    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return Theme.defaultLightTheme
        case .dark:
            return Theme.defaultDarkTheme
        }
    }
}
final class ThemeState: ObservableObject {
    @Published private(set) var colorScheme: ColorScheme
    @Published private(set) var isDark: Bool
    private let settings = SettingsService()

    init() {
        let lastTheme = settings.getTheme()
        self.colorScheme = lastTheme ? Theme.dark.colorScheme : Theme.light.colorScheme
        isDark = lastTheme
    }
    
    func setTheme(isDark: Bool){
        self.isDark = isDark
        settings.setTheme(isDark: isDark)
        colorScheme = isDark ? Theme.dark.colorScheme : Theme.light.colorScheme
    }
}
