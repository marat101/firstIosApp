//
//  ColorScheme.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 22.07.2023.
//

import Foundation
import SwiftUI

struct ColorScheme: Equatable {
    let backgroundColor1: Color
    let backgroundColor2: Color
}

enum Theme {
    case light, dark
    
    private static let defaultLightTheme = ColorScheme(
        backgroundColor1: Color(0xFCFDD7),
        backgroundColor2: Color(0xB5E7AB)
    )
    
    private static let defaultDarkTheme = ColorScheme(
        backgroundColor1: Color(0x0A192F),
        backgroundColor2: Color(0x0A192F)
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
    
    init(colorScheme: ColorScheme? = nil) {
        self.colorScheme = colorScheme ?? Theme.light.colorScheme
    }
    
    func setTheme(theme: ColorScheme){
        colorScheme = theme
    }
}
