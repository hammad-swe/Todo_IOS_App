//
//  itemModel.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 07/03/2026.
//

import Foundation

//Immutable struct
struct itemModel: Identifiable {
    let id : String
    let title : String
    let isDone : Bool
    
    init(id: String = UUID().uuidString , title: String, isDone: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isDone = isDone
    }
    func updateCompletion() -> itemModel{
        return itemModel(id: id, title: title, isDone: !isDone)
    }
}
