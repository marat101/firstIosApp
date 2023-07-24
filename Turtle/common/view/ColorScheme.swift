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
    
    let bottomBarBackground: [Color]
    let navButtonEnabled: Color
    let navButtonDisabled: Color

    let transparentCardBackground: Color
    
    // Select schedule card
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
}

enum Theme {
    case light, dark
    
    private static let defaultDarkTheme = ColorScheme(
        backgroundColors: [Color(0x0A192F),Color(0x0A192F)],
        backgroundTurtle: Color(0x464F6B, alpha: 0.85),
        topBarColors: [Color(0x112240),Color(0x112240)],
        topBarTitle: Color(0x8D91D1),
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
        nameItemText: Color(0x8D91D1)
    )
    
    private static let defaultLightTheme = ColorScheme(
        backgroundColors: [Color(0xFCFDD7),Color(0xB5E7AB)],
        backgroundTurtle: Color(0x417B65, alpha: 0.28),
        topBarColors: [Color(0x417B65), Color(0xA7CE7B)],
        topBarTitle: Color(0xFFFFFF),
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
        nameItemText: Color(0x96D162)
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

    init(colorScheme: Theme? = nil) {
        self.colorScheme = colorScheme?.colorScheme ?? Theme.light.colorScheme
        isDark = colorScheme == Theme.dark
    }
    
    func setTheme(theme: Theme){
        colorScheme = theme.colorScheme
        self.isDark = theme == .dark
    }
}
