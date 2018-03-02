//
//  NotificationOptionTests.swift
//  LocalNotificationWrapper_Tests
//
//  Created by Ezequiel Galindo on 2/26/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import LocalNotificationWrapper

class NotificationOptionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSingle() {
        let option = NotificationOption.alert
        XCTAssertTrue(option == .alert)
    }

//    func testInit() {
//        var options = [NotificationOption]()
//        let indexes = [1, 2, 4, 8]
//        for index in indexes {
//            let option = NotificationOption(rawValue: index)!
//            options.append(option)
//        }
//        XCTAssertTrue(options.count == 4)
//    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
