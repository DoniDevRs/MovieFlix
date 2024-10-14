//
//  Date+Ext.swift
//  MovieFlix
//
//  Created by Doni Silva on 23/09/24.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.day().month().year())
    }
}
