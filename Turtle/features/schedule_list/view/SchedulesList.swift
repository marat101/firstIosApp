//
//  ScheduleList.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 16.07.2023.
//

import SwiftUI
import ToastSwiftUI

struct SchedulesList<VM: ScheduleListViewModel>: View {
    
    @StateObject var scheduleListViewModel: VM
    @EnvironmentObject var theme: ThemeState
    @State var isVisible = false
    
    var body: some View {
        ZStack(alignment: .center){
            NavigationLink(isActive: $scheduleListViewModel.navigate,
                           destination: {Schedule(viewModel: ScheduleViewModel(name: scheduleListViewModel.selected!))},
                           label: {EmptyView()})
            ScheduleSelectFrame(
                isGroup: scheduleListViewModel.isGroup,
                onNextClick: {
                    scheduleListViewModel.navigateToSchedule()
                },
                onSheetOpen: {
                    scheduleListViewModel.loadGroups()
                    isVisible = true},
                selected: scheduleListViewModel.selected ?? "Выбрать"
            )
        }
        .toast($scheduleListViewModel.toast)
        .sheet(isPresented: $isVisible, content: {
            SheetContent(
                items: scheduleListViewModel.schedules ?? [],
                isGroup: scheduleListViewModel.isGroup,
                text: $scheduleListViewModel.search,
                {isVisible = false},
                onNameClick: { name in
                    scheduleListViewModel.onNameChange(name: name)
                    isVisible = false
                })
        })
    }
}
