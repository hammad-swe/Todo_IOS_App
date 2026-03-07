//
//  ListView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [itemModel] = [
        itemModel.init(title: "This is First Titles", isDone: false),
        itemModel.init(title: "This is Second Titles", isDone: true),
        itemModel.init(title: "Third", isDone: false),
    ]
    
    var body: some View {
        //Todo List
        List {
            ForEach(items){ item in
               ListRowView(item: item)
                
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo App 📋")
        .navigationBarItems(
            leading: EditButton()
                .foregroundStyle(.blue),
            trailing:
                NavigationLink("Add", destination: Text("Desitnation")).foregroundStyle(.blue)
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    
}
