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
        
        ZStack{
            if listViewModel.items.isEmpty{
              noItemView()
            }
            else{
            //Todo List
            List {
                        ForEach(listViewModel.items){ item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())

                }
            }
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton()
                .foregroundStyle(Color.accentColor),
            trailing:
                NavigationLink("Add", destination: AddView(textfieldText:"")).foregroundStyle(Color.accentColor)
        )
    }
}



#Preview {
    NavigationView {
        ListView()
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .environmentObject(ListViewModel())
    
}
