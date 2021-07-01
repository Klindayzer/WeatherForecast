//
//  WeatherIconGenerator.swift
//  WeatherForecast
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import UIKit

final class WeatherIconGenerator {
    
    class func getIcon(from iconUrl: String) -> UIImage? {
        
        guard !iconUrl.isEmpty, let iconName = getIconName(iconUrl) else {
            return nil
        }
        
        return UIImage(named: iconName)
    }
    
    class func getIconName(_ iconUrl: String) -> String? {
        
        let iconName = String(iconUrl.suffix(7))
        let parts = iconName.components(separatedBy: ".")
        
        guard parts.count == 2 else {
            return nil
        }
        
        let icon = parts[0]
        
        guard icon.count == 3  else {
            return nil
        }
        
        return icon
    }
}
