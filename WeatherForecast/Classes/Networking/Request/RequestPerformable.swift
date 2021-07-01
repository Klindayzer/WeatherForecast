//
//  RequestPerformable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

protocol BaseRequestPerformable {
    var networkClient: NetworkRouter { get }
    func handleResult<T: Codable> (data: Data?, decodingType: T.Type, completion: @escaping RequestCompletion<T>)
}

extension BaseRequestPerformable {
    
    func handleResult<T: Codable> (data: Data?, decodingType: T.Type, completion: @escaping RequestCompletion<T>) {
        
        if let data = data {
            do {
                let responseError = try JSONDecoder().decode(ResponseError.self, from: data)
                if let error = responseError.error,
                   let code = error.code,
                   let message = error.message {
                    completion(.failure(.generic(code: code, message: message)))
                    
                } else {
                    let genericModel = try JSONDecoder().decode(decodingType, from: data)
                    completion(.success(genericModel))
                }
                
            } catch(let exeption) {
                print(exeption.localizedDescription)
                completion(.failure(.jsonParsingFailure))
            }
        }
    }
}

protocol RequestPerformable: AnyObject, BaseRequestPerformable {
    func performRequest<T: Codable>(from buildable: RequestBuildable, decodingType: T.Type, completion: @escaping RequestCompletion<T>)
}

extension RequestPerformable {
    
    func performRequest<T: Codable>(from buildable: RequestBuildable, decodingType: T.Type, completion: @escaping RequestCompletion<T>) {
        
        networkClient.request(buildable) { data, response, error in
            
            DispatchQueue.main.async { [weak self] in
                
                if let error = error {
                    completion(.failure(.generic(code: -1, message: error.localizedDescription)))
                    return
                }
                
                self?.handleResult(data: data, decodingType: decodingType, completion: completion)
            }
        }
    }
}
