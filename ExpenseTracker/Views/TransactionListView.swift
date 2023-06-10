//
//  TransactionListView.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/9/23.
//

import SwiftUI

struct TransactionListView: View {
	@EnvironmentObject var transactionListViewModel: TransactionListViewModel
    var body: some View {
		VStack {
			List {
				// MARK: - Transaction Groups
				ForEach(
					Array(
						transactionListViewModel.groupTransactionByMonth()),
						id: \.key
				) { month, transactions in
					Section {
						// MARK: - Transaction List
						ForEach(transactions) { transaction in
							TransactionRow(transaction: transaction)
						}
					} header: {
						// MARK: - Transaction Month
						Text(month)
					}
					.listSectionSeparator(.hidden)
				}
			}
			.listStyle(.plain)
		}
		.navigationTitle("Transactions")
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionListView_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
    static var previews: some View {
		Group {
			NavigationView {
				TransactionListView()
			}
			NavigationView {
				TransactionListView()
					.preferredColorScheme(.dark)
			}
		}
		.environmentObject(transactionListViewModel)
    }
}
