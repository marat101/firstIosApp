//
//  ScheduleList.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 16.07.2023.
//

import SwiftUI

struct SchedulesList<VM: ScheduleListViewModel>: View {
    
    @StateObject var scheduleListViewModel: VM
    @EnvironmentObject var theme: ThemeState
    @State var isVisible = false
    
    var body: some View {
        ZStack(alignment: .center){
            ScheduleSelectFrame(
                isGroup: scheduleListViewModel.isGroup,
                onNextClick: {
                },
                onSheetOpen: {
                    scheduleListViewModel.loadGroups()
                    isVisible = true},
                selected: scheduleListViewModel.selected
            )
        }.sheet(isPresented: $isVisible, content: {
            SheetContent(
                items: scheduleListViewModel.schedules ?? [],
                isGroup: scheduleListViewModel.isGroup,
                {isVisible = false},
                onNameClick: { name in
                    scheduleListViewModel.onNameChange(name: name)
                    isVisible = false
                })
        })
    }
}
