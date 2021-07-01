//
//  DateGenerator.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import Foundation

class DateGenerator {
    
    private static var dateFormatter: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static var yesterdayDate: String {
                
        let toDate = Date()
        let fromDate = Calendar.current.date(byAdding: .day, value: -1, to: toDate)
        return dateFormatter.string(from: fromDate ?? Date())
    }
    
    class func date(before day: Int) -> String {
        
        let day = day * -1
        let toDate = Date()
        let fromDate = Calendar.current.date(byAdding: .day, value: day, to: toDate)
        return dateFormatter.string(from: fromDate ?? Date())
    }
}
