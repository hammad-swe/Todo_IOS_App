//
//  ListViewModel.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 08/03/2026.
//

import Foundation
internal import Combine
internal import SwiftUI

class ListViewModel : ObservableObject{
    @Published var items : [itemModel] = []
    
    init() {
       getItems()
    }
    
    func getItems(){
        let newItems = [
            itemModel.init(title: "This is First Titles", isDone: false),
            itemModel.init(title: "This is Second Titles", isDone: true),
            itemModel.init(title: "Third", isDone: false),
        ]
        items.append(contentsOf: newItems)
    }
    // for delete Items
    func deleteItem(indexSet : IndexSet){
            items.remove(atOffsets: indexSet)
    }
    // for Move Item
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
        
    }
}
