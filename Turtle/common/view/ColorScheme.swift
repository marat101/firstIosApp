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
        navButtonDisabled: Color(0x9E9C9F)
    )
    
    private static let defaultLightTheme = ColorScheme(
        backgroundColors: [Color(0xFCFDD7),Color(0xB5E7AB)],
        backgroundTurtle: Color(0x417B65, alpha: 0.28),
        topBarColors: [Color(0x417B65), Color(0xA7CE7B)],
        topBarTitle: Color(0xFFFFFF),
        bottomBarBackground: [Color(0x86C8A7), Color(0xB3E3AE)],
        navButtonEnabled: Color(0xFFFFFF),
        navButtonDisabled: Color(0x575756)
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
