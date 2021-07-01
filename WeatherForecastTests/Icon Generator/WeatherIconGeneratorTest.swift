//
//  WeatherIconGeneratorTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import XCTest
@testable import WeatherForecast

class WeatherIconGeneratorTest: XCTestCase {
    
    func testIconNotGeneratorWhenWrongValuePassed() {
        
        // Given
        let iconUrl = "cdn.weatherapi.com/weather/64x64/night"
        
        // When
        let icon = WeatherIconGenerator.getIcon(from: iconUrl)
        
        // Then
        XCTAssertNil(icon)
    }
    
    func testIconNotGeneratorWhenCorrectValuePassed() {
        
        // Given
        let iconUrl = "cdn.weatherapi.com/weather/64x64/night/116.png"
        
        // When
        let icon = WeatherIconGenerator.getIcon(from: iconUrl)
        
        // Then
        XCTAssertNotNil(icon)
    }
}
