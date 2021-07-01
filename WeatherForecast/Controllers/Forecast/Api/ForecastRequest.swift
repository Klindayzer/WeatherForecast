//
//  ForecastRequest.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

class ForecastRequest: RequestPerformable {
 
    var networkClient: NetworkRouter
    
    init(networkClient: NetworkRouter = Router()) {
        self.networkClient = networkClient
    }
    
    func getForecastWeatherUpdates(country: String, days: Int, completion: @escaping (ForecastModel?, NetworkError?) -> Void) {
        
        let buildable = ForecastBuildable(country: country, days: days)
        performRequest(from: buildable, decodingType: ForecastModel.self) { result in
            
            switch result {
            case .success(let data):
                completion(data, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
