//
//  Schedule.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 24.07.2023.
//

import SwiftUI

struct Schedule: View {
    
    @EnvironmentObject var theme: ThemeState
    @StateObject var viewModel: ScheduleViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            CustomTopbar(title: viewModel.name){dismiss()}
            TabView(content: {
                if let days = viewModel.days?.days {
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs) //TODO:
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                    if let pairs = days.first?.apairs {
                        Day(day: days.first?.day ?? "", list: pairs)
                    }
                }
            }).tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.horizontal, 1)
        }.onAppear {
            viewModel.loadData()
        }.background(TurtlesBackground())
    }
}
