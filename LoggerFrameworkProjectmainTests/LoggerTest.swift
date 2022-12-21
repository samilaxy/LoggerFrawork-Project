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
    var env = Logger.Environment.self
    
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
        
        sut.log("dgg", severity: .veryLow)
        var logMessage = sut.logMessage
        //When
        var result = sut.log("dgg", severity: .veryLow)
        //Then
        XCTAssertEqual(result, logMessage)
    }
}
