//
//  RequestEncoding.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

enum RequestEncoding {
    
    case json
    case url
    
    func encode(urlRequest: inout URLRequest, parameters: RequestParameters?) throws {
        do {
            switch self {
            case .url:
                guard let urlParameters = parameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                
            case .json:
                guard let bodyParameters = parameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }
}
