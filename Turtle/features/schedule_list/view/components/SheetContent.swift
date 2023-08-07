//
//  SheetContent.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 23.07.2023.
//

import SwiftUI

struct SheetContent: View {
    @EnvironmentObject var theme: ThemeState
    @Binding var text: String
    let items: [String]
    private let columns: [GridItem]
    let onNameClick: (String) -> Void
    let onClose: () -> Void
    
    init(
        items: [String],
        isGroup: Bool,
        text: Binding<String>,
        _ onCloseClick: @escaping () -> Void,
        onNameClick: @escaping (String) -> Void) {
            self._text = text
            self.items = items
            self.onNameClick = onNameClick
            self.onClose = onCloseClick
            self.columns = isGroup ?
            [GridItem(.flexible()),GridItem(.flexible())] : [GridItem(.flexible())]
        }
    
    
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("", text: $text)
                    .placeholder(when: text.split(separator: " ").isEmpty, placeholder: {
                        Text("Поиск…")
                            .foregroundColor(theme.colorScheme.pairTextSecondColor)
                            .font(.qanelas(size: 17))
                    })
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.qanelas(size: 17))
                    .foregroundColor(theme.colorScheme.pairTextColor)
                    .padding(.top, 10)
                    .padding(.horizontal, 5)
                LazyVGrid(columns: columns, content: {
                    ForEach(items.filter({ str in Bool()
                        return text.split(separator: " ").isEmpty ? true : str.lowercased().contains(text.lowercased())
                    }), id: \.self, content: { name in
                        NameItem(name: name){ str in
                            onNameClick(str)
                        }
                    })
                })
            }.padding(.horizontal, 8)
        }.background(
            LinearGradient(
                colors: theme.colorScheme.backgroundColors,
                startPoint: .top,
                endPoint: .bottom).edgesIgnoringSafeArea(.bottom))
    }
}

struct NameItem: View {
    
    let name: String
    let onClick: (String) -> Void
    @EnvironmentObject var theme: ThemeState
    
    var body: some View {
        Button(action: {
            onClick(name)
        }, label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.clear)
                .background(
                    Text(name)
                        .font(.qanelas(size:20))
                        .foregroundColor(theme.colorScheme.nameItemText)
                        .padding(.horizontal, 8),
                    alignment: .leading)
                .frame(height: 45)
                .background(
                    theme.colorScheme.nameItemBackground
                ).cornerRadius(12)
        })
    }
}
