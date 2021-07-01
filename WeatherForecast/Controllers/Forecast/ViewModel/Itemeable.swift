//
//  Itemeable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import Foundation

protocol Itemeable {
    
    var forecastDays:[Forecastday] { set get }
    var items: [ForecastPresentable] { set get }
    var itemsCount: Int { get }
    
    func detailsViewModel(at index: Int) -> DetailsViewModel?
    func item(at index: Int) -> ForecastPresentable?
}

extension Itemeable {
   
    var itemsCount: Int {
        items.count
    }
    
    func detailsViewModel(at index: Int) -> DetailsViewModel? {
        
        guard let day = forecastDays[safe: index] else {
            return nil
        }
        
        return DetailsViewModel(day: day)
    }
    
    func item(at index: Int) -> ForecastPresentable? {
        return items[safe: index]
    }
}
