//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/7/23.
//

import Foundation

var transactionPreviewData = Transaction(
	id: 1,
	date: "02/21/2023",
	institution: "Capital One",
	account: "Checking",
	merchant: "Apple",
	amount: 3349.99,
	type: "debit",
	categoryID: 801,
	category: "Hardware",
	isPending: false,
	isTransfer: false,
	isExpense: true,
	isEdited: false
)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
