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
}

enum Theme {
    case light, dark
    
    private static let defaultLightTheme = ColorScheme(
        backgroundColors: [Color(0xFCFDD7),Color(0xB5E7AB)],
        backgroundTurtle: Color(0x417B65, alpha: 0.28),
        topBarColors: [Color(0x417B65), Color(0xA7CE7B)]
    )
    
    private static let defaultDarkTheme = ColorScheme(
        backgroundColors: [Color(0x0A192F),Color(0x0A192F)],
        backgroundTurtle: Color(0x464F6B, alpha: 0.85),
        topBarColors: [Color(0x112240),Color(0x112240)]
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
    @Published private(set) var theme: Theme

    init(colorScheme: Theme? = nil) {
        self.colorScheme = colorScheme?.colorScheme ?? Theme.light.colorScheme
        theme = colorScheme ?? Theme.light
    }
    
    func setTheme(theme: Theme){
        colorScheme = theme.colorScheme
        self.theme = theme
    }
}
