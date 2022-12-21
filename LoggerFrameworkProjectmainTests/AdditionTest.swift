//
//  AdditionTest.swift
//  LoggerFrameworkProjectmainTests
//
//  Created by Noye Samuel on 21/12/2022.
//

import XCTest
@testable import LoggerFrameworkProjectmain

final class AdditionTest: XCTestCase {

    // Create SUT
     var sut: Addition!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Addition()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testAdd(){
        //Given
        let a = 4
        let b = 5
        //When
        var result = sut.add(a: a, b: b)
        //Then
        XCTAssertEqual(result, 9)
    }

}
