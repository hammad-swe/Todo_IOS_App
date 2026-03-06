//
//  ListRowView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

import SwiftUI

struct ListRowView: View {
    
    @State var title : String
    
    var body: some View {
        //Rows In Todos
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ListRowView(title: "This Is First Title")
}

