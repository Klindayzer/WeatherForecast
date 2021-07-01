//
//  ForecastPresentable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

struct ForecastPresentable {
    
    private let model: Forecastday?
    
    init(model: Forecastday?) {
        self.model = model
    }
    
    var date: String {
        model?.date ?? ""
    }
    
    var humidity: String {
        
        let value = model?.day?.avghumidity ?? 0
        return "\(Int(value))%"
    }
    
    var chanceOfRain: String {
        
        let value = model?.day?.dailyChanceOfRain ?? "0"
        return "\(value)%"
    }
    
    var maxTemp: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.digreeType == .centigrade {
            digree = model?.day?.maxtempC ?? 0
            type = "C"
            
        } else {
            digree = model?.day?.maxtempF ?? 0
            type = "F"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "\(intDigree)° \(type)"
    }
    
    var minTemp: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.digreeType == .centigrade {
            digree = model?.day?.mintempC ?? 0
            type = "C"
            
        } else {
            digree = model?.day?.mintempF ?? 0
            type = "F"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "\(intDigree)° \(type)"
    }
    
    var wind: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.speedType == .mph {
            digree = model?.day?.maxwindMph ?? 0
            type = "m per hour"
            
        } else {
            digree = model?.day?.maxwindKph ?? 0
            type = "km per hour"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "\(intDigree)° \(type)"
    }
    
    var sunrise: String {
        model?.astro?.sunrise ?? ""
    }
    
    var sunset: String {
        model?.astro?.sunset ?? ""
    }
    
    var moonrise: String {
        model?.astro?.moonrise ?? ""
    }
    
    var moonset: String {
        model?.astro?.moonset ?? ""
    }
    
    var moonPhase: String {
        model?.astro?.moonPhase ?? ""
    }
    
    var condition: String {
        model?.day?.condition?.text ?? ""
    }
    
    var conditionIcon: UIImage? {
        WeatherIconGenerator.getIcon(from: model?.day?.condition?.icon ?? "")
    }
    
    var digree: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.digreeType == .centigrade {
            digree = model?.day?.avgtempC ?? 0
            type = "C"
            
        } else {
            digree = model?.day?.avgtempF ?? 0
            type = "F"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "\(intDigree)° \(type)"
    }
}

