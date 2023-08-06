//
//  DayView.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 06.08.2023.
//

import SwiftUI

struct Day: View {
    
    let day: String
    let list: [PairsModel]
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        ScrollView{
            LazyVStack(pinnedViews: .sectionHeaders) {
                Spacer().padding(.top, 10)
                Section(header: date, content: {
                    Spacer().padding(.top, 5)
                    ForEach(list, id: \.self) { pair in
                        Pair(pair: pair)
                    }
                })
            }
        }
    }
    
    var date: some View {
        HStack {
            Image("icon_left").renderingMode(.template).foregroundColor(theme.colorScheme.dateText)
            Text(day)
                .font(.qanelas(size: 20))
                .lineLimit(1)
                .foregroundColor(theme.colorScheme.dateText)
            Image("icon_right").renderingMode(.template).foregroundColor(theme.colorScheme.dateText)
        }.padding(.horizontal, 7)
            .frame(height: 30)
            .background(RoundedRectangle(cornerRadius: 12).foregroundColor(theme.colorScheme.dateBakground))
            .padding(.top, 5)
            .shadow(color: .black.opacity(0.15),radius: 4, x: 0, y: 4)
    }
}

extension PairsModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(time)
        hasher.combine(apair.description)
    }
    
    static func == (lhs: PairsModel, rhs: PairsModel) -> Bool {
        let time: Bool = lhs.time == rhs.time
        let pairs: Bool = lhs.apair.description == rhs.apair.description
        return time && pairs
    }
}
