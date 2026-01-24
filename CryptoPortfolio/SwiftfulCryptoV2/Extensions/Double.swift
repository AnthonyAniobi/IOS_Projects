//
//  Double.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 24/01/2026.
//

import Foundation


extension Double {
    
    /// Converts a Double into a currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a currency as a string with 2-6 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///Convert 12.3456 to $12.3456
    ///Convert 0.123456 to $0.123456
    ///```
    func asCurrencyWith6DecimalPlaces() -> String {
        return currencyFormatter6.string(from: NSNumber(value: self)) ?? ""
    }
    
    /// Converts a Double into a currency with 2 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a currency as a string with 2 decimal places
    ///```
    ///Convert 1234.56 to $1,234.56
    ///```
    func asCurrencyWith2DecimalPlaces() -> String {
        return currencyFormatter6.string(from: NSNumber(value: self)) ?? ""
    }
    
    /// Converts a Double into a currency as a string with 2 decimal places
    ///```
    ///Convert 1234.56 to 1234.56
    ///Convert 12.3456 to 12.3456
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a currency as a string with 2 decimal places
    ///```
    ///Convert 1234.56 to 1234.56%
    ///Convert 12.3456 to 12.3456%
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
