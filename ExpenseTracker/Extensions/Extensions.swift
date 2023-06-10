//
//  ColorExtension.swift
//  ExpenseTracker
//
//  Created by Justin Hold on 6/7/23.
//

import Foundation
import SwiftUI

extension Color {
	static let background = Color("Background")
	static let icon = Color("Icon")
	static let text = Color("Text")
	static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
	static let allNumericUSA: DateFormatter = {
		print("DEBUG: Initializing DateFormatter...")
		let formatter = DateFormatter()
		formatter.dateFormat = "MM/dd/yyyy"
		return formatter
	}()
}

extension String {
	func dateParsed() -> Date {
		guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
		return parsedDate
	}
}

extension Date {
	func formatted() -> String {
		return self.formatted(.dateTime.year().month().day())
	}
}

extension Double {
	func roundedTo2Digits() -> Double {
		return (self * 100).rounded() / 100
	}
}
