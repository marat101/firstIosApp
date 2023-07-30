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

    
    var body: some View {
        VStack {

            LinearGradient(
                colors: theme.colorScheme.topBarColors,
                startPoint: .leading,
                endPoint: .trailing
            ).edgesIgnoringSafeArea(.top)
                .frame(height: 0)
                
            Testtt()
            
            TabView(content: {
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
                Text(viewModel.name)
            }).tabViewStyle(.page(indexDisplayMode: .never)).edgesIgnoringSafeArea(.all)
                .navigationBarTitle(viewModel.name, displayMode: .large)
                .toolbar(content: {
                    Button(
                        action: {
                            theme.setTheme( theme: theme.isDark ? Theme.light : Theme.dark)
                        }
                    ){
                        Image(!theme.isDark ? "moon" : "sun").frame(width: 30, height: 30) //TODO: картинки перенести
                    }
                })
        }.background(TurtlesBackground()).navigationBarTitleDisplayMode(.inline)
    }
}

struct Testtt: View {
    
    init(){
        print("tagtag")
    }
    
    var body: some View {
        Text("ssss")
    }
}
