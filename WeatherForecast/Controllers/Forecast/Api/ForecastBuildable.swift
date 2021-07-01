//
//  ForecastBuildable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

struct ForecastBuildable: RequestBuildable {
    
    private let days: Int
    private let country: String
    
    init(country: String, days: Int) {
        self.country = country
        self.days = days
    }
    
    var endPoint: RequestEndPoint {
        .forecast
    }
    
    var parameters: RequestParameters? {
        [
            "q": country,
            "days": days
        ]
    }
}
