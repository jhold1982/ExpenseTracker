//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/7/23.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
	@EnvironmentObject var transactionListViewModel: TransactionListViewModel
//	var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 24) {
					
					// MARK: - Title
					Text("Overview")
						.font(.title2)
						.bold()
					
					// MARK: - Line Chart
					let data = transactionListViewModel.accumulateTransactions()
					let totalExpenses = data.last?.1 ?? 0
					CardView {
						VStack {
							ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title)
							LineChart()
						}
						.background(Color.systemBackground)
					}
					.data(data)
					.chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
					.frame(height: 300)
					
					// MARK: - Transaction List
					RecentTransanctionsListView()
				}
				.padding()
				.frame(maxWidth: .infinity)
			}
			.background(Color.background)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				// MARK: - Notification Item
				ToolbarItem {
					Image(systemName: "bell.badge")
						.symbolRenderingMode(.palette)
						.foregroundStyle(Color.icon, .primary)
				}
			}
		}
		.navigationViewStyle(.stack)
		.accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
	static let transactionListViewModel: TransactionListViewModel = {
		let transactionListViewModel = TransactionListViewModel()
		transactionListViewModel.transactions = transactionListPreviewData
		return transactionListViewModel
	}()
    static var previews: some View {
		Group {
			ContentView()
			ContentView()
				.preferredColorScheme(.dark)
		}
		.environmentObject(transactionListViewModel)
    }
}
