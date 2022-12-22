//
//  LoggerTest.swift
//  LoggerFrameworkProjectmainTests
//
//  Created by Noye Samuel on 21/12/2022.
//

import XCTest
@testable import LoggerFrameworkProjectmain

final class LoggerTest: XCTestCase {
    //create SUT
    
    var sut: Logger!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = Logger(environment: .debugging)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = sut.dateFormat
        let date = formatter.string(from: Date.now)
       return date
    }
    
    func testLog(){
        
        //Given
        let logMessage = "[\(String(describing: getDate()))]:[veryLow]:[dgg]"
        
        //When
        let result = sut.log("dgg", severity: .veryLow)
        
        //Then
        XCTAssertEqual(result, logMessage)
        XCTAssertEqual(sut.logMessage, logMessage)
    }
    func testSeverity(){
        
        //Given
        let logMessageVeryHigh = "[\(String(describing: getDate()))]:[veryHigh]:[VeryHigh]"
        let logMessageHigh = "[\(String(describing: getDate()))]:[high]:[High]"
        let logMessageModerate = "[\(String(describing: getDate()))]:[moderate]:[Moderate]"
        let logMessageLow = "[\(String(describing: getDate()))]:[low]:[Low]"
        let logMessageVeryLow = "[\(String(describing: getDate()))]:[veryLow]:[VeryLow]"
        
        //When
        let resultVeryHigh = sut.severity("VeryHigh", severity: .veryHigh)
        let resultHigh = sut.severity("High", severity: .high)
        let resultModerate = sut.severity("Moderate", severity: .moderate)
        let resultLow = sut.severity("Low", severity: .low)
        let resultVeryLow = sut.severity("VeryLow", severity: .veryLow)
        
        //Then
        XCTAssertEqual(resultVeryHigh, logMessageVeryHigh)
        XCTAssertEqual(resultHigh, logMessageHigh)
        XCTAssertEqual(resultModerate, logMessageModerate)
        XCTAssertEqual(resultLow, logMessageLow)
        XCTAssertEqual(resultVeryLow, logMessageVeryLow)
    }
}
