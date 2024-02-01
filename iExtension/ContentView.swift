//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI



struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var numberToAdd = 1
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(numbers, id: \.self){ num in
                    Text("Row: \(num)")
                }.onDelete(perform: { indexSet in
                    deletRow(at: indexSet)
                })
            }
            Button("Add Number"){
                
                numbers.append(numberToAdd)
                
                numberToAdd += 1
            }.animation(.bouncy, value: numberToAdd)
            
                .toolbar{
                    EditButton()
                }
        }
        
    }
    
    func deletRow(at indexOffset: IndexSet){
        numbers.remove(atOffsets: indexOffset)
    }
}

#Preview {
    ContentView()
}
