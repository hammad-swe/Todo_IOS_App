//
//  AddView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 06/03/2026.
//

internal import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textfieldText : String
    
    @State var alertTitle : String = ""
    @State var ShowAlert : Bool = false
    
    
    var body: some View {
        //Add New Todos
        ScrollView{
            VStack {
                TextField("Write Something Here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                Button(action: saveButtonPressed,label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })

            }
            .padding(14)
        }
        .navigationTitle("Add Items 🖊️")
        .alert(isPresented: $ShowAlert, content: getAlert)
    }
    // add items
    func saveButtonPressed(){
        if isAppropriate(){
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    // check limit
    func isAppropriate() -> Bool{
        if textfieldText.count < 3 {
            alertTitle = "Your Todo Item must be at least 3 characters Long!!! 😨"
            ShowAlert.toggle()
            return false
        }
        return true
    }
    
    // Alert function
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddView(textfieldText: "Write Something Here...")
    }
    
}
