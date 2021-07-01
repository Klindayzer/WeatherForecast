//
//  EnvironmentTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 30/06/2021.
//

import XCTest
@testable import WeatherForecast

class EnvironmentTest: XCTestCase {
    
    private let enivronment = Environment.shared
    
    func testApiBaseUrl() {
        
        // Given
        let baseUrl = "https://api.weatherapi.com"
        
        // When
        let baseUrlToTest = enivronment.getValue(for: .apiBaseUrl)
        
        // Then
        XCTAssertEqual(baseUrl, baseUrlToTest)
    }
    
    func testApiKey() {
        
        // Given
        let key = "5bda441ee5c4427686b204450213006"
        
        // When
        let keyToTest = enivronment.getValue(for: .apiKey)
        
        // Then
        XCTAssertEqual(key, keyToTest)
    }
    
    func testIsDebug() {
        XCTAssertTrue(enivronment.isDebug)
    }
}
