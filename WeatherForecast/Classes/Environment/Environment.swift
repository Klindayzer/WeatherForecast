//
//  Environment.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 30/06/2021.
//

import Foundation

enum PropertyListKeys: String {
    case plistEntryKey = "Integration Specific Identifiers"
    case apiBaseUrl = "API_BASE_URL"
    case apiKey = "API_KEY"
    case scheme = "CURRENT_SCHEME_NAME"
}

private enum Scheme: String {
    case development = "Development"
    case production = "Production"
}

final class Environment {
    
    static let shared = Environment()
    
    private lazy var pList: [String: Any] = {
        
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        guard let dict = dict[PropertyListKeys.plistEntryKey.rawValue] as? [String : Any] else {
            fatalError("Integration Identifiers not found")
        }
        
        return dict
    }()
    
    private init() {}
    
    func getValue(for key: PropertyListKeys) -> String {
        return pList[key.rawValue] as? String ?? ""
    }
    
    var isDebug: Bool {        
        return getValue(for: .scheme) == Scheme.development.rawValue
    }
}
