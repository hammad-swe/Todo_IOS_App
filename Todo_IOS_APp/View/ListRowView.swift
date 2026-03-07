//
//  ListRowView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

import SwiftUI

struct ListRowView: View {
    
    let item : itemModel
    
    var body: some View {
        //Rows In Todos
        HStack{
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isDone ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview("First Item", traits: .sizeThatFitsLayout) {
    ListRowView(item: itemModel(title: "first item", isDone: false))
}

#Preview("Second Item", traits: .sizeThatFitsLayout) {
    ListRowView(item: itemModel(title: "second item", isDone: true))
}
