//
//  HistoryBuildable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

struct HistoryBuildable: RequestBuildable {
    
    private let country: String
    private let startDate: String
    private let endDate: String
    
    init(country: String, startDate: String, endDate: String) {
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
    }
    
    var endPoint: RequestEndPoint {
        .history
    }
    
    var parameters: RequestParameters? {
        [
            "q": country,
            "dt": startDate,
            "end_dt": endDate
        ]
    }
}
