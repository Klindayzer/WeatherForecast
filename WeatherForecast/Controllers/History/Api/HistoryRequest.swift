//
//  HistoryRequest.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

class HistoryRequest: RequestPerformable {

    var networkClient: NetworkRouter
    
    init(networkClient: NetworkRouter = Router()) {
        self.networkClient = networkClient
    }
    
    func getHistoryUpdates(country: String, startDate: String, endDate: String, completion: @escaping (ForecastModel?, NetworkError?) -> Void) {
        
        let buildable = HistoryBuildable(country: country, startDate: startDate, endDate: endDate)
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
