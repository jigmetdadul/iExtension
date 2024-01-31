//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI



struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var name: String
    var body: some View {
        Text("hello this is a second view")
        Button("Dismiss"){
            dismiss()
        }
    }
}



struct ContentView: View {
    @State private var showSecondView = false
    var body: some View {
        Button("Seond View"){
            showSecondView.toggle()
        }
        .sheet(isPresented: $showSecondView, content: {
                SecondView(name: "JIgmet stanzin dadul")
        })
        
    }
}

#Preview {
    ContentView()
}
