//
//  ContentView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 31/01/24.
//

import SwiftUI


struct expensesItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses{
    var items = [expensesItems](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    init(){
        if let savedItemLists = UserDefaults.standard.data(forKey: "items"), let decoded =  try? JSONDecoder().decode([expensesItems].self, from: savedItemLists){
            items = decoded
            return
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var itemList = Expenses()
    @State private var showAddNewExpense = false
    var body: some View {
        NavigationStack{
            List{
                ForEach(itemList.items){ items in
                    HStack{
                        VStack(alignment: .leading){
                            Text( items.name )
                            Text(items.type)
                        }
                        Spacer()
                        Text(items.amount, format: .currency(code: "USD"))
                        
                    }
                }
                .onDelete(perform: deleteItem)
            }
            
            .navigationTitle("iExpense")
            .toolbar(content: {
                Button("Add item button", systemImage: "plus"){
                    showAddNewExpense = true
                }
                .foregroundColor(.black)
            })
            .sheet(isPresented: $showAddNewExpense, content: {
                AddView(itemList: itemList)
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
