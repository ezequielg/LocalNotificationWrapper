//
//  NotificationOptionParser.swift
//  LocalNotificationWrapper_Tests
//
//  Created by Ezequiel Galindo on 2/26/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import LocalNotificationWrapper

class NotificationOptionExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testToAuthorizationOptions() {
        let options = [NotificationOption.alert, NotificationOption.badge]
        if #available(iOS 10, *) {
            let authOptions = options.toUNAuthorizationOptions()
            XCTAssert(authOptions.contains(.alert))
            XCTAssert(authOptions.contains(.badge))
            XCTAssertTrue(authOptions.contains(.sound) == false, "The Auth options don't contain the sound option.")
        }
    }

    func testToUserNotificationType() {
        let options = [NotificationOption.sound, NotificationOption.carPlay]
        if #available(iOS 10, *) {
            let authOptions = options.toUIUserNotificationTypes()
            XCTAssert(authOptions.contains(.sound))
            XCTAssert(authOptions.contains(.alert) == false, "The Auth options don't contain the alert option.")
        }
    }

    func testEmptytoAuthorizationOptions() {
//        var options = []
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
