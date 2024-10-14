//
//  DoubleToString.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

extension Double {
    func converToStringWithDecimal() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 1
        let number = NSNumber(value: self)
        return numberFormatter.string(from: number)
    }
}
