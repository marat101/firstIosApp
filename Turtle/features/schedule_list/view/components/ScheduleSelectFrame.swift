//
//  ScheduleSelectFrame.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 23.07.2023.
//

import SwiftUI

struct ScheduleSelectFrame: View {
    
    @EnvironmentObject var theme: ThemeState
    let isGroup: Bool
    let onNextClick: () -> Void
    let onSheetOpen: () -> Void
    let selected: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(theme.colorScheme.transparentCardBackground)
                .cornerRadius(12)
            VStack(spacing: 10) {
                Image(isGroup ? theme.colorScheme.selectGroupImage : theme.colorScheme.selectTeacherImage)
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                    .frame(height: 83)
                
                Button(action: {
                    onSheetOpen()
                }){
                    ZStack(alignment: .center) {
                        ZStack(alignment: .topTrailing) {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 1)
                                .foregroundColor(theme.colorScheme.selectBtnStroke)
                                .frame(height: 56)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundColor(theme.colorScheme.selectButtonBackground)
                                )
                            
                            Image("turtle_select")
                                .resizable(resizingMode: .stretch)
                                .renderingMode(.template)
                                .foregroundColor(theme.colorScheme.selectButtonTurtle)
                                .scaledToFit()
                                .frame(height: 56)
                        }
                        Text(selected)
                            .font(.qanelas(size: 22))
                            .foregroundColor(theme.colorScheme.selectBtnText)
                    }
                }.padding(.horizontal, 23)
                nextBtn
            }
        }.frame(width: 296, height: 258)
    }
    
    var nextBtn: some View {
        
        NavigationLink(destination: {
            Schedule(viewModel: ScheduleViewModelImpl(name: selected))
        }, label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.clear)
                .background(
                    Text("ДАЛЕЕ").font(.qanelas(size: 20)).foregroundColor(theme.colorScheme.nextBtnText)
                ).frame(height: 56)
                .background(
                    LinearGradient(colors: theme.colorScheme.nextBtnBackground, startPoint: .leading, endPoint: .trailing)
                ).cornerRadius(12)
        .padding(.horizontal, 23)
        })
        
//        Button(action: {theme.navigate()}, label: {
//            RoundedRectangle(cornerRadius: 12)
//                .foregroundColor(Color.clear)
//                .background(
//                    Text("ДАЛЕЕ").font(.qanelas(size: 20)).foregroundColor(theme.colorScheme.nextBtnText)
//                ).frame(height: 56)
//                .background(
//                    LinearGradient(colors: theme.colorScheme.nextBtnBackground, startPoint: .leading, endPoint: .trailing)
//                ).cornerRadius(12)
//        .padding(.horizontal, 23)
//        })
    }
}
