//
//  ScheduleList.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import SwiftUI

struct SchedulesList<VM:ScheduleListViewModel>: View  {
    
    @ObservedObject var scheduleListViewModel: VM

    var body: some View {
        ScrollView {
            VStack {
                Button("request", action: {
                    scheduleListViewModel.loadGroups()
                })
                ForEach(scheduleListViewModel.schedules ?? [], id: \.self) { str in
                    Text(str)
                }
            }
        }
    }
}
