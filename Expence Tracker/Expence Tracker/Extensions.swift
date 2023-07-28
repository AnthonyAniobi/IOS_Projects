//
//  Extensions.swift
//  Expence Tracker
//
//  Created by Anthony Aniobi on 24/07/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        return formater
    }()
}


extension String{
    func dateParsed()->Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else{return Date()}
        return parsedDate
    }
}

extension Date: Strideable{
    func formated() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}


extension Double{
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded()/100
    }
}
