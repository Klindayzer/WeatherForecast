//
//  cacheable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 02/07/2021.
//

import Foundation

protocol Cacheable {
    func toDictionary<T: Codable>(data: T) throws -> [String: Any]
    func cache(_ dic: [String: Any], key: String)
    func loadFromCache<T: Decodable>(key: String) -> T?
}

extension Cacheable {
    
    func toDictionary<T: Codable>(data: T) throws -> [String: Any] {
        
        let data = try JSONEncoder().encode(data)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    func cache(_ dic: [String: Any], key: String) {
        UserDefaults.standard.setValue(dic, forKey: key)
    }
    
    func loadFromCache<T: Decodable>(key: String) -> T? {
        
        guard let dic = UserDefaults.standard.object(forKey: key) as? [String: Any] else {
            return nil
        }
        return try? T(from: dic)
    }
}

private extension Decodable {
  
    init(from: Any) throws {
        
    let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
    let decoder = JSONDecoder()
    self = try decoder.decode(Self.self, from: data)
  }
}
