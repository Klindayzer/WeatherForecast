//
//  ForecastBuildableTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import XCTest
@testable import WeatherForecast

class ForecastBuildableTest: XCTestCase {

    func testCurrentBuildable() {
        
        // Given
        let country = "Dubai"
        let days = 10
        
        // When
        let buildable = ForecastBuildable(country: country, days: days)
        
        // Then
        XCTAssertEqual(buildable.endPoint, .forecast)
        XCTAssertEqual(buildable.method, .get)
        XCTAssertEqual(buildable.encoding, .url)
        XCTAssertEqual(buildable.timeout, .sixty)
        XCTAssertEqual(buildable.verson, .v1)
        XCTAssertNil(buildable.headers)
        XCTAssertEqual(buildable.parameters?["q"] as? String, country)
        XCTAssertEqual(buildable.parameters?["days"] as? Int, days)
    }
}
