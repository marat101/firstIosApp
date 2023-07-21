//
//  ScheduleList.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import SwiftUI

struct GroupsList<VM:ScheduleListViewModel>: View  {
    
    @ObservedObject var groupsViewModel: VM

    var body: some View {
        ScrollView {
            VStack {
                Button("request", action: {
                    groupsViewModel.loadGroups()
                })
                ForEach((groupsViewModel.schedules.group ?? []) + (groupsViewModel.schedules.teacher ?? []), id: \.self) { str in
                    Text(str)
                }
            }
        }
    }
}
