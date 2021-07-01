//
//  HistoryViewModel.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import Foundation

class HistoryViewModel: Itemeable, Cacheable {
    
    // MARK: - Private Properties
    private let request = HistoryRequest()
    internal var forecastDays = [Forecastday]()
    internal var items = [ForecastPresentable]()
    
    
    // MARK: - Exposed Properties
    var currentPresentable = CurrentPresentable(model: nil)
    
    
    // MARK: - Exposed Methods
    func fetchHistory(startDate: String, endDate: String, completion: @escaping ApiCompletion) {
        
        let key = "History"
        if let model: ForecastModel = loadFromCache(key: key) {
            handleResponse(model: model, completion: completion)
            return
        }
        
        request.getHistoryUpdates(country: AppSettings.shared.selectedCity, startDate: startDate, endDate: endDate) { [weak self] model, error in
                                    
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
