//
//  AddView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

import SwiftUI

struct AddView: View {
    
    @State var textfieldText : String
    
    var body: some View {
        //Add New Todos
        ScrollView{
            VStack {
                TextField("Write Something Here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                    
                }

            }
            .padding(14)
        }
        .navigationTitle("Add Items 🖊️")
    }
}

#Preview {
    NavigationView {
        AddView(textfieldText: "Write Something Here...")
    }
    
}
