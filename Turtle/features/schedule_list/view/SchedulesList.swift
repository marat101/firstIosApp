//
//  ScheduleList.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import SwiftUI

struct SchedulesList<VM:ScheduleListViewModel>: View  {
    
    @ObservedObject var scheduleListViewModel: VM
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        ScrollView {
            ZStack{
                theme.colorScheme.backgroundColor2
                VStack {
                    Button("request", action: {
                        scheduleListViewModel.loadGroups()
                        theme.setTheme(theme: theme.colorScheme == Theme.dark.colorScheme ? Theme.light.colorScheme : Theme.dark.colorScheme)
                    })
                    ForEach(scheduleListViewModel.schedules ?? [], id: \.self) { str in
                        Text(str)
                    }}
            }
        }
    }
}
