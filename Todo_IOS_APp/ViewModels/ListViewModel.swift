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
    @Published var items : [itemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    let itemsKey: String = "Item_List"
    
    init() {
       getItems()
    }
    
    func getItems(){
//        let newItems = [
//            itemModel.init(title: "This is First Titles", isDone: false),
//            itemModel.init(title: "This is Second Titles", isDone: true),
//            itemModel.init(title: "Third", isDone: false),
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItem =  try? JSONDecoder().decode([itemModel].self, from: data)
        else { return }
        
        self.items = saveItem
        
    }
    // for delete Items
    func deleteItem(indexSet : IndexSet){
            items.remove(atOffsets: indexSet)
    }
    // for Move Item
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    // add Item
    func addItem(title: String){
        let newitem =  itemModel(title: title , isDone: false)
        items.append(newitem)
        
    }
    
    func updateItem(item: itemModel){
//      if  let index = items.firstIndex { exixtingIndex in
//            return exixtingIndex.id == item.id
//      }{
//          // run this code
//      }
        
        if let index =  items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults().set(encodedData, forKey: itemsKey)
        }
    }
}
