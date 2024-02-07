//
//  AddView.swift
//  iExtension
//
//  Created by Jigmet stanzin Dadul on 06/02/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = String()
    @State private var type = "Buisness"
    @State private var amount = Double()
    let types = ["Buisness", "Household"]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    var itemList:Expenses
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter the expense details"){
                    TextField("Expense name", text: $name)
                        .foregroundColor(.brown)
                    Picker("Type of Expense", selection: $type) {
                        ForEach(types, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("Expense Amount", value: $amount, format: .currency(code: localCurrency))
                        .foregroundColor(.brown)
                }
               
            }
            .navigationTitle("Add new Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button("Add"){
                    let newItem = expensesItems(name: name, type: type, amount: amount)
                    itemList.items.append(newItem)
                    dismiss()
                }
                .foregroundColor(.black)
            })
        }
    }
}

#Preview {
    AddView(itemList: Expenses())
}
