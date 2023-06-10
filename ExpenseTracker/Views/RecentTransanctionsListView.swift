//
//  RecentTransanctionsListView.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/8/23.
//

import SwiftUI

struct RecentTransanctionsListView: View {
	@EnvironmentObject var transactionListViewModel: TransactionListViewModel
    var body: some View {
		VStack {
			HStack {
				// MARK: - Header Title
				Text("Recent Transactions")
					.bold()
				Spacer()
				// MARK: - Header Link
				NavigationLink {
					TransactionListView()
				} label: {
					HStack(spacing: 4) {
						Text("See All")
						Image(systemName: "chevron.right")
					}
					.foregroundColor(Color.text)
				}
			}
			.padding(.top)
			// MARK: - Recent Transaction List
			ForEach(Array(transactionListViewModel.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
				TransactionRow(transaction: transaction)
				Divider()
					.opacity(index == 4 ? 0 : 1)
			}
			
		}
		.padding()
		.background(Color.systemBackground)
		.clipShape(RoundedRectangle(
			cornerRadius: 20,
			style: .continuous)
		)
		.shadow(
			color: .primary.opacity(0.2),
			radius: 10,
			x: 0,
			y: 5
		)
    }
}

struct RecentTransanctionsListView_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
    static var previews: some View {
		Group {
			RecentTransanctionsListView()
			RecentTransanctionsListView()
				.preferredColorScheme(.dark)
		}
		.environmentObject(transactionListViewModel)
    }
}
