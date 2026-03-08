//
//  Todo_IOS_APpApp.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

internal import SwiftUI

@main
struct Todo_IOS_APpApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup{
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
        
    }
}
