//
//  CurrentPresentable.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

struct CurrentPresentable {
    
    private let model: ForecastModel?
    
    init(model: ForecastModel?) {
        self.model = model
    }
    
    var city: String {
        model?.location?.name ?? ""
    }
    
    var country: String {
        model?.location?.country ?? ""
    }
    
    var condition: String {
        model?.current?.condition?.text ?? ""
    }
    
    var conditionIcon: UIImage? {
        WeatherIconGenerator.getIcon(from: model?.current?.condition?.icon ?? "")
    }
    
    var digree: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.digreeType == .centigrade {
            digree = model?.current?.tempC ?? 0
            type = "C"
            
        } else {
            digree = model?.current?.tempF ?? 0
            type = "F"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "\(intDigree)° \(type)"
    }
    
    var feels: String {
        
        var digree: Double
        var type: String
        
        if AppSettings.shared.digreeType == .centigrade {
            digree = model?.current?.feelslikeC ?? 0
            type = "C"
            
        } else {
            digree = model?.current?.feelslikeF ?? 0
            type = "F"
        }
        
        let intDigree = Int(digree)
        guard intDigree > 0 else { return "" }
        
        return "Feels Like \(intDigree)° \(type)"
    }
}
