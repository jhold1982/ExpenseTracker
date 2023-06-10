//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/7/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
	@StateObject var transactionListViewModel = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(transactionListViewModel)
        }
    }
}
