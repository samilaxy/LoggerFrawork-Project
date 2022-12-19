//
//  LoggerTest.swift
//  LoggerFrawork-Project
//
//  Created by Noye Samuel on 19/12/2022.
//

import XCTest
@testable import LoggerFrawork_Project

final class LoggerTest: XCTestCase {
    // Create SUT
     var sut: Logger!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Logger()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testLogger(){
        //Given
        var env: sut.Environment = .staging
        #if PROD
        env = .production
        #elseif DEBUG
        env = .debugging
        #endif
        var session = "\(Date())"
        //When
        
        var result = sut.configure(userID: "ID1", session: session, environment: env)
        //Then
        XCTAssertEqual(result, "[\(String(describing: date))]:[\("veryLow")]:[\("dgg")]")
    }

}
