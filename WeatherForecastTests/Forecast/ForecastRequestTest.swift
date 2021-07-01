//
//  ForecastRequestTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import XCTest
@testable import WeatherForecast

class ForecastRequestTest: XCTestCase {

    var request: ForecastRequest?
    
    override func setUp() {
        request = nil
    }

    func testForecastAPI() {
        
        // Given
        let fileName = "forecast"
        let client = RouterMock(fileName: fileName)
        request = ForecastRequest(networkClient: client)
        
        let expectation = expectation(description: "forecast")
        var testModel: ForecastModel?
        var testError: NetworkError?
        // When
        
        request?.getForecastWeatherUpdates(country: "", days: 0, completion: { model, error in
            
            testError = error
            testModel = model
            expectation.fulfill()
        })
        
        // Then
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNil(testError)
            XCTAssertNotNil(testModel)
            XCTAssertEqual(testModel?.forecast?.forecastday?.count, 3)
        }
    }
}
