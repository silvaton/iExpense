//
//  ContentView.swift
//  iExpense
//
//  Created by Ton Silva on 31/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    var groupedItems: [String: [ExpenseItem]] {
        Dictionary(grouping: expenses.items, by: {$0.type})
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedItems.keys.sorted(), id: \.self) { category in
                    Section(category) {
                        ForEach(groupedItems[category]!, id: \.id) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                        }
                        .onDelete(perform: removeItem)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
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
