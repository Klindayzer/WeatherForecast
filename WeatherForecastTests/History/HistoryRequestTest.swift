//
//  HistoryRequestTest.swift
//  WeatherForecastTests
//
//  Created by Adham Alkhateeb on 01/07/2021.
//

import XCTest
@testable import WeatherForecast

class HistoryRequestTest: XCTestCase {

    var request: HistoryRequest?
    
    override func setUp() {
        request = nil
    }

    func testForecastAPI() {
        
        // Given
        let fileName = "history"
        let client = RouterMock(fileName: fileName)
        request = HistoryRequest(networkClient: client)
        
        let expectation = expectation(description: "history")
        var testModel: ForecastModel?
        var testError: NetworkError?
        // When
        
        request?.getHistoryUpdates(country: "", startDate: "", endDate: "", completion: { model, error in
            
            testError = error
            testModel = model
            expectation.fulfill()
        })
        
        // Then
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNil(testError)
            XCTAssertNotNil(testModel)
            XCTAssertEqual(testModel?.forecast?.forecastday?.count, 5)
        }
    }
}
