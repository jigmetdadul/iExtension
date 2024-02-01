//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI



struct ContentView: View {
     
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        
        Button("Count tap: \(tapCount)"){
            tapCount += 1
            
        }
        Button("Decrement tap"){
            tapCount -= 1
        }
        
    }
}

#Preview {
    ContentView()
}
