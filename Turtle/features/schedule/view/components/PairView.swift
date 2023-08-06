//
//  PairView.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 06.08.2023.
//

import SwiftUI

struct Pair: View {
    
    let pair: PairsModel
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        HStack(spacing: 0) {
            time
            PairInfo(pair: pair.apair.first!)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 12).foregroundColor(theme.colorScheme.pairBackground))
        .shadow(color: .black.opacity(0.15),radius: 4, x: 0, y: 4)
        .padding(.horizontal, 12).padding(.top, 4)
    }
    
    var time: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Text("\(pair.apair.first?.number ?? 0)").font(.qanelas(size: 20))
                .frame(width: 25, height: 25)
                .background(Circle().foregroundColor(theme.colorScheme.pairTextColor))
                .frame(maxWidth: .infinity, alignment: .center)
            Text(pair.apair.first?.start ?? "")
                .font(.qanelas(size: 20))
                .foregroundColor(theme.colorScheme.pairTextColor)
            Text(pair.apair.first?.end ?? "")
                .font(.qanelas(size: 14))
                .foregroundColor(theme.colorScheme.pairTextSecondColor)
        }.padding(.trailing, 15).frame(width: 71)
    }
}

struct PairInfo: View {
    
    let pair: PairModel
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0,content: {
            Text(pair.doctrine)
                .font(.qanelas(size: pair.doctrine.count > 20 ? 14 : 18))
                .foregroundColor(theme.colorScheme.pairTextColor)
                .padding(.vertical, 6)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 100).foregroundColor(theme.colorScheme.pairNameBackground))
                .padding(.top, 3)
            
            HStack {
                Image("navigation_teacher")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
                    .frame(width: 16, height: 12)
                    
                Text(pair.teacher)
                    .font(.qanelas(size: 14))
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
            }.padding(.leading, 16).padding(.top, 11)
            
            HStack {
                Image("key")
                    .renderingMode(.template)
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
                    .frame(width: 16, height: 16)
                    
                Text(pair.auditoria)
                    .font(.qanelas(size: 14))
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
            }.padding(.leading, 16).padding(.top, 6)
            
            HStack {
                Image("building")
                    .renderingMode(.template)
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
                    .frame(width: 16, height: 16)
                    
                Text(pair.corpus)
                    .font(.qanelas(size: 14))
                    .foregroundColor(theme.colorScheme.pairTextSecondColor)
            }.padding(.leading, 16).padding(.top, 6)
        })
    }
}
