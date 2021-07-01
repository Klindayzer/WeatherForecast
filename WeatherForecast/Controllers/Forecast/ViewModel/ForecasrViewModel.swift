//
//  ForecasrViewModel.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

class ForecasrViewModel: Itemeable, Cacheable {
    
    // MARK: - Private Properties
    private let request = ForecastRequest()
    internal var forecastDays = [Forecastday]()
    internal var items = [ForecastPresentable]()
    
    
    // MARK: - Exposed Properties
    var currentPresentable = CurrentPresentable(model: nil)
    
    
    // MARK: - Exposed Methods
    func fetchForcastUpdates(days: Int, completion: @escaping ApiCompletion) {
        
        let key = "Forcast\(days)"
        if let model: ForecastModel = loadFromCache(key: key) {
            handleResponse(model: model, completion: completion)
            return
        }
        
        request.getForecastWeatherUpdates(country: AppSettings.shared.selectedCity, days: days) { [weak self] model, error in
            
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            do {
                if let dic = try self?.toDictionary(data: model) {
                    self?.cache(dic, key: key)
                }
            } catch {}
            self?.handleResponse(model: model, completion: completion)
        }
    }
    
    // MARK: - Private Methods
    private func handleResponse(model: ForecastModel?, completion: @escaping ApiCompletion) {
        
        currentPresentable = CurrentPresentable(model: model)
        forecastDays = model?.forecast?.forecastday ?? []
        items = forecastDays.compactMap { ForecastPresentable(model: $0) }
        completion(nil)
    }
}
