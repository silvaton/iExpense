//
//  ContentView.swift
//  iExpense
//
//  Created by Ton Silva on 31/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { expense in
                    Text(expense.name)
                }
                .onDelete(perform: removeItem)
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Banho", type: "Jobin", amount: 150)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
