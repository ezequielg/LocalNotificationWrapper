//
//  LocalNotificationTests.swift
//  LocalNotificationWrapper_Tests
//
//  Created by Ezequiel Galindo on 2/27/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import UserNotifications
@testable import LocalNotificationWrapper

class LocalNotificationTests: XCTestCase {

    let title = "Hey"
    let subtitle =  "I am an amazing subtitle"
    let body = "I am the body"

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitNoDefaultValue() {
        let localNotification = LocalNotification(title: self.title, subtitle: self.subtitle, body: self.body)
        XCTAssert(localNotification.body == self.body)
        XCTAssert(localNotification.title == self.title)
        XCTAssert(localNotification.subtitle == self.subtitle)
    }

    func testInitWithDefaultValue() {
        let localNotification = LocalNotification(title: self.title, body: self.body)
        XCTAssert(localNotification.body == self.body)
        XCTAssert(localNotification.title == self.title)
        XCTAssert(localNotification.subtitle == "")
    }

    func testGetSoundForiOS9() {
        let customSound = "CUSTOM_SOUND"
        let localNotification = LocalNotification(title: self.title, body: self.body)
        localNotification.sound = customSound
        XCTAssert(localNotification.getSoundForiOS9() == customSound)
    }

    func testGetSoundForiOS10() {
        let customSound = "CUSTOM_SOUND"
        let localNotification = LocalNotification(title: self.title, body: self.body)
        localNotification.sound = customSound
        if #available(iOS 10.0, *) {
            let notificationSound = UNNotificationSound(named: customSound)
            XCTAssert(localNotification.getSoundForiOS10() == notificationSound)
        }
    }
    

    
}
