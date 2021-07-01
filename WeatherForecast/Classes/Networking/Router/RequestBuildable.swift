//
//  RequestBuildable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

typealias RequestHeaders = [String: String]
typealias RequestParameters = [String: Any]

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum RequestTimeout: Int {
    case fifteen = 15
    case thirty = 30
    case sixty = 60
    case ninty = 90
}

enum ApiVersion: String {    
    case v1 = "v1"
}

protocol RequestBuildable {

    var endPoint: RequestEndPoint { get }
    var method: RequestMethod { get }
    var encoding: RequestEncoding { get }
    var timeout: RequestTimeout { get }
    var verson: ApiVersion { get }
    var headers: RequestHeaders? { get }
    var parameters: RequestParameters? { get }
}

extension RequestBuildable {
    
    var fullParameters: RequestParameters {
        
        var currentParameters = parameters ?? RequestParameters()
        currentParameters["key"] = Environment.shared.getValue(for: .apiKey)
        return currentParameters
    }
    
    var method: RequestMethod {
        .get
    }
    
    var encoding: RequestEncoding {
        .url
    }
    
    var timeout: RequestTimeout {
        .sixty
    }
    
    var verson: ApiVersion {
        .v1
    }
    
    var headers: RequestHeaders? {
        nil
    }
}
