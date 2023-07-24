//
//  SheetContent.swift
//  Turtle
//
//  Created by Марат Наврузалиев on 23.07.2023.
//

import SwiftUI

struct SheetContent: View {
    @EnvironmentObject var theme: ThemeState
    @State var text = ""
    let items: [String]
    private let columns: [GridItem]
    let onNameClick: (String) -> Void
    let onClose: () -> Void
    
    init(
        items: [String],
        isGroup: Bool,
        _ onCloseClick: @escaping () -> Void,
        onNameClick: @escaping (String) -> Void) {
            self.items = items
            self.onNameClick = onNameClick
            self.onClose = onCloseClick
            self.columns = isGroup ?
            [GridItem(.flexible()),GridItem(.flexible())] : [GridItem(.flexible())]
        }
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Поиск…", text: $text).fixedSize(horizontal: false, vertical: true)
                LazyVGrid(columns: columns, content: {
                    ForEach(items, id: \.self, content: { name in
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

struct SheetContent_Previews: PreviewProvider {
    static var previews: some View {
        SheetContent(
            items: ["AAAAAAA","AAAAAAA","AAAAAAA","AAAAAAA","AAAAAAA","AAAAAAA"],
            isGroup: true,
            {},
            onNameClick: { name in }
        ).environmentObject(ThemeState())
    }
}
