//
//  RouterMock.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation
@testable import WeatherForecast

enum JsonError: Error {
    case encodingError
    case serializationError(error: Error?)
}

enum FileError: Error {
    case notFound
}

enum ErrorMock: Error {
    case noFile
}
class RouterMock: NetworkRouter {
    
    private let fileName: String
        
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func request(_ route: RequestBuildable, completion: @escaping NetworkRouterCompletion) {
        
        guard let data = try? dataFromFile(named: fileName) else {
            completion(nil, nil, ErrorMock.noFile)
            return
        }
        completion(data, nil, nil)
    }
    
    func cancel() {}
    
    private func dataFromFile(named fileName: String) throws -> Data {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") else {
            throw FileError.notFound
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
        } catch let error {
            throw JsonError.serializationError(error: error)
        }
    }
}
