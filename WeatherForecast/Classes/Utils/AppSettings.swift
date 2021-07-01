//
//  AppSettings.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import Foundation

final class AppSettings {
    
    enum SpeedType: String {
        case mph = "mph"
        case kmph = "kmph"
    }
    
    enum DigreeType: String {
        case centigrade = "Centigrade"
        case fahrenheit = "Fahrenheit"
    }
    
    static let shared = AppSettings()
    
    private init() {}
    
    var selectedCity = "Dubai"
    
    var speedType: SpeedType {
        
        let raw = UserDefaults.standard.value(forKey: "SpeedType") as? String
        switch raw {
        case SpeedType.mph.rawValue :
            return .mph
            
        default:
            return .kmph
        }
    }
    
    func setSpeedType(type: SpeedType) {
        UserDefaults.standard.setValue(type.rawValue, forKey: "SpeedType")
    }
    
    var digreeType: DigreeType {
        
        let raw = UserDefaults.standard.value(forKey: "DigreeType") as? String
        switch raw {
        case DigreeType.fahrenheit.rawValue :
            return .fahrenheit
            
        default:
            return .centigrade
        }
    }
    
    func setDigreeType(type: DigreeType) {
        UserDefaults.standard.setValue(type.rawValue, forKey: "DigreeType")
    }
}
