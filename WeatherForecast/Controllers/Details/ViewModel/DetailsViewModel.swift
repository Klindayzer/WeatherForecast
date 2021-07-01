//
//  DetailsViewModel.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class DetailsViewModel {

    // MARK: - Private Properties
    private var items = [DetailsCellPresentable]()
    private var day: Forecastday
    
    
    // MARK: - Constructor
    init(day: Forecastday) {
        
        self.day = day
        generateItems()
    }
    
    
    // MARK: - Computed Propertis
    var itemsCount: Int {
        items.count
    }
    
    
    // MARK: - Exposed Methods
    func item(at index: Int) -> DetailsCellPresentable? {
        return items[safe: index]
    }
    
    
    // MARK: - Private Methods
    private func generateItems() {
        
        let presentable = ForecastPresentable(model: day)
        items.append(DetailsCellPresentable(title: "Date", value: presentable.date))
        items.append(DetailsCellPresentable(title: "Humidity", value: presentable.humidity))
        items.append(DetailsCellPresentable(title: "Chance of rain", value: presentable.chanceOfRain))
        items.append(DetailsCellPresentable(title: "Max temperature", value: presentable.maxTemp))
        items.append(DetailsCellPresentable(title: "Min temperature", value: presentable.minTemp))
        items.append(DetailsCellPresentable(title: "Wind Speed", value: presentable.wind))
        items.append(DetailsCellPresentable(title: "Sinrise", value: presentable.sunrise))
        items.append(DetailsCellPresentable(title: "Sunset", value: presentable.sunset))
        items.append(DetailsCellPresentable(title: "Moonrise", value: presentable.moonrise))
        items.append(DetailsCellPresentable(title: "Moonset", value: presentable.moonset))
        items.append(DetailsCellPresentable(title: "Moon phase", value: presentable.moonPhase))
    }
}
