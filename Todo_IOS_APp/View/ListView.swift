//
//  ListView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [String] = [
        "This is First Titles",
        "This is Second Titles",
        "Third"
    ]
    
    var body: some View {
        //Todo List
        List {
            ForEach(items, id: \.self){ items in
                ListRowView(title: items)
                
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo App 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: Text("Desitnation"))
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    
}
