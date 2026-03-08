//
//  ListView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

internal import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        //Todo List
        List {
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton()
                .foregroundStyle(.blue),
            trailing:
                NavigationLink("Add", destination: AddView(textfieldText: "Write a New Task Here")).foregroundStyle(.blue)
        )
    }
}



#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
    
}
