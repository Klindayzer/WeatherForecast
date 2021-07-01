//
//  RequestResult.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

typealias RequestCompletion<T: Codable> = (RequestResult<T>) -> Void

enum RequestResult<T: Codable> {
    
    case success(T)
    case failure(NetworkError)
}

struct ResponseError: Codable {
    let error: ApiError?
}

struct ApiError: Codable {
    let code: Int?
    let message: String?
}

