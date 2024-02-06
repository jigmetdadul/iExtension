//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI


struct expensesItems{
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [expensesItems]()
}

struct ContentView: View {
    
    @State private var itemList = Expenses()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(itemList.items, id: \.name){ items in
                    Text(items.name)
                }
                .onDelete(perform: deleteItem)
            }
            
            .navigationTitle("iExpense")
            .toolbar(content: {
                Button("Add item button", systemImage: "plus"){
                    let newItem = expensesItems(name: "Text", type: "mode", amount: 10)
                    itemList.items.append(newItem)
                }
                .foregroundColor(.black)
            })
        }
    }
    func deleteItem(at offset: IndexSet){
        itemList.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
