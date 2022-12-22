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

    func testLogger(){
        //Given
        let formatter = DateFormatter()
        formatter.dateFormat = sut.dateFormat
        let date = formatter.string(from: Date.now)
        
        let logMessage = "[\(String(describing: date))]:[veryLow]:[dgg]"
        
        //When
        let result = sut.log("dgg", severity: .veryLow)
        
        //Then
        XCTAssertEqual(result, logMessage)
        XCTAssertEqual(sut.logMessage, logMessage)
    }
}
