//
//  noItemView.swift
//  Todo_IOS_APp
//
//  Created by Hammad Ali on 20/03/2026.
//

internal import SwiftUI

struct noItemView: View {
    
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("No List Items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(textfieldText: "Add"),
                    label: {
                    Text("Add Something New")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.secondaryColorSet : Color.accentColor)
                            .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.secondaryColorSet.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1: 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        noItemView()
            .navigationTitle("Title")
    }
    
   
}
