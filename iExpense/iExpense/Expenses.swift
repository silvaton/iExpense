//
//  Expenses.swift
//  iExpense
//
//  Created by Ton Silva on 31/5/23.
//

import Foundation
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
