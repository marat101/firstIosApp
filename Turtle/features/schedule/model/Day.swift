//
//  Day.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 06.08.2023.
//

import Foundation

struct DayModel: Decodable {
    let day: String
    let apairs: [PairsModel]
}
