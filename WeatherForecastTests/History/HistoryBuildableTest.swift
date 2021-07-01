//
//  HistoryBuildableTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import XCTest
@testable import WeatherForecast

class HistoryBuildableTest: XCTestCase {

    func testCurrentBuildable() {
        
        // Given
        let country = "Dubai"
        let startDate = "2021-06-26"
        let endDate = "2021-07-01"
        
        // When
        let buildable = HistoryBuildable(country: country, startDate: startDate, endDate: endDate)
        
        // Then
        XCTAssertEqual(buildable.endPoint, .history)
        XCTAssertEqual(buildable.method, .get)
        XCTAssertEqual(buildable.encoding, .url)
        XCTAssertEqual(buildable.timeout, .sixty)
        XCTAssertEqual(buildable.verson, .v1)
        XCTAssertNil(buildable.headers)
        XCTAssertEqual(buildable.parameters?["q"] as? String, country)
        XCTAssertEqual(buildable.parameters?["dt"] as? String, startDate)
        XCTAssertEqual(buildable.parameters?["end_dt"] as? String, endDate)
    }
}
