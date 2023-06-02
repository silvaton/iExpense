//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ton Silva on 31/5/23.
//

import Foundation
struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
