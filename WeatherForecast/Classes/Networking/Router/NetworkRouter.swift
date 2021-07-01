//
//  NetworkRouter.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

enum NetworkError: Error {
    case generic(code: Int, message: String)
    case encodingFailed
    case missingBaseURL
    case missingURL
    case jsonParsingFailure
    case reachability
}

protocol NetworkRouter {
    func request(_ route: RequestBuildable, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router: NetworkRouter, RequestLogger {
    
    private var task: URLSessionTask?
    
    var shouldLog: Bool {
        Environment.shared.isDebug
    }
    
    func request(_ route: RequestBuildable, completion: @escaping NetworkRouterCompletion) {
        
        guard Reachability.isConnectedToNetwork else {
            completion(nil, nil, NetworkError.reachability)
            return
        }
        
        let session = URLSession.shared
        do {
            let request = try buildRequest(from: route)
            logRequest(request)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                self.logResponse(response as? HTTPURLResponse, data: data, error: error)
                completion(data, response, error)
            })
        } catch {
            logError(error)
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

private extension Router {
    
    func buildRequest(from route: RequestBuildable) throws -> URLRequest {
        
        let baseUrlString = Environment.shared.getValue(for: .apiBaseUrl)
        guard !baseUrlString.isEmpty, var url = URL(string: baseUrlString) else {
            throw NetworkError.missingBaseURL
        }
        
        url = url.appendingPathComponent(route.verson.rawValue)
        url = url.appendingPathComponent(route.endPoint.rawValue)
        let timeoutInterval = TimeInterval(route.timeout.rawValue)
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: timeoutInterval)
        
        request.httpMethod = route.method.rawValue
        do {
            addHeaders(route.headers, request: &request)
            try configureParameters(encoding: route.encoding, parameters: route.fullParameters, request: &request)
            return request
            
        } catch {
            throw error
        }
    }
    
    func addHeaders(_ additionalHeaders: RequestHeaders?, request: inout URLRequest) {
        
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    func configureParameters(encoding: RequestEncoding, parameters: RequestParameters?, request: inout URLRequest) throws {
        do {
            try encoding.encode(urlRequest: &request, parameters: parameters)
        } catch {
            throw error
        }
    }
}
