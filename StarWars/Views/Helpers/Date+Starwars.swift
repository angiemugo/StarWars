//
//  Date+Starwars.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 27/07/2021.
//

import Foundation

extension Date {
    func getFormattedHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
    
    func getRelativeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true
        return "\(dateFormatter.string(from: Date())), \(Date().getFormattedHour())"
    }
}
