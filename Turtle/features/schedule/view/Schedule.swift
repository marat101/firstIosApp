//
//  Schedule.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import SwiftUI

struct Schedule<VM: ScheduleViewModel>: View {

    @EnvironmentObject var theme: ThemeState
    @StateObject var viewModel: VM
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            CustomTopbar(title: viewModel.name){dismiss()}
                            
            TabView(content: {
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
            }).tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.horizontal, 1)
                
        }.background(TurtlesBackground())
            
    }
}
