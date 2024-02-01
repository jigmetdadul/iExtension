//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI



struct ContentView: View {
     
    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")
    var body: some View {
        
        Button("Count tap: \(tapCount)"){
            tapCount += 1
            UserDefaults.standard.setValue(tapCount, forKey: "tapCount")
        }
        
    }
}

#Preview {
    ContentView()
}
