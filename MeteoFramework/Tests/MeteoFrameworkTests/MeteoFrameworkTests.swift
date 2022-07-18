import XCTest
@testable import MeteoFramework

final class MeteoFrameworkTests: XCTestCase {
    
    func test_WeatherService_loadWeatherData() {
        let weatherService = WeatherService()
        let inputCity : String = "Paris"
        var outputCity : String = ""
        let expectation = self.expectation(description: "Test")
        
        weatherService.loadWeatherData(townName: inputCity, { weather, error in
            DispatchQueue.main.sync {
                outputCity = weather?.city ?? ""
                expectation.fulfill()
            }
        })
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotEqual(outputCity, "")
        //

        
    }
}
