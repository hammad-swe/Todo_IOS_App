//
//  itemModel.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 07/03/2026.
//

import Foundation

struct itemModel: Identifiable {
    let id : String = UUID().uuidString
    let title : String
    let isDone : Bool
}
