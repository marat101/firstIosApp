//
//  Schedule.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import SwiftUI

struct Schedule: View {
    let name: String
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all).navigationBarBackButtonHidden(true)
            Text(name)
        }
    }
}

struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        Schedule(name: "aaaa")
    }
}
