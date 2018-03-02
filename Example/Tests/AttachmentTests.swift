//
//  AttachmentTests.swift
//  LocalNotificationWrapper_Tests
//
//  Created by Ezequiel Galindo on 2/27/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import LocalNotificationWrapper

class AttachmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    func testInit() {
//        let uuidIdentifier = UUID().uuidString
//        let documentDirectoryURL =  try! FileManager.default.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        print("URL \(documentDirectoryURL)")
//
//        let attachment = Attachment(identifier: uuidIdentifier, url: documentDirectoryURL, options: nil)
//        XCTAssert(attachment.identifier == uuidIdentifier)
//        XCTAssert(attachment.url == documentDirectoryURL)
//        XCTAssertNil(attachment.options)
//    }
//
//    @available(iOS 10.0, *)
//    func testNotValidNotificationAttachment() {
//        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        print("URL \(documentDirectoryURL)")
//        let attachment = Attachment(identifier: UUID().uuidString, url: documentDirectoryURL, options: nil)
//
//        let notificationAttachment = attachment.notificationAttachment()
//        print("Notification attach \(notificationAttachment)")
//        XCTAssertNil(notificationAttachment)
//    }
//
//    @available(iOS 10.0, *)
//    func testValidAttachment() {
//        let landscapeURL = Bundle.main.url(forResource: "landscape", withExtension: ".jpeg")
//        let attachment = Attachment(identifier: UUID().uuidString, url: landscapeURL!, options: nil)
//        let notificationAttachment = attachment.notificationAttachment()
//        XCTAssertNotNil(notificationAttachment, "The notification attachment should be created correctly, given there is a resource with the supported type in the app bundle.")
//    }
//
//    @available(iOS 10.0, *)
//    func testEmptyAttachment() {
//        let localNotification = LocalNotification(title: "Hey", body: "...")
//        XCTAssert(localNotification.attachments.isEmpty)
//        XCTAssert(localNotification.attachments.toUNNotificationAttachment().isEmpty)
//    }
//
//    @available(iOS 10.0, *)
//    func testManyAttachments() {
//        let fileNames = ["landscape", "animal"]
//        let localNotification = LocalNotification(title: "I am a notification", body: "With attachments.")
//        for fileName in fileNames {
//            let fileURL = Bundle.main.url(forResource: fileName, withExtension: ".jpeg")
//            let attachment = Attachment(identifier: UUID().uuidString, url: fileURL!, options: nil)
//            localNotification.attachments.append(attachment)
//        }
//        XCTAssert(localNotification.attachments.count == 2)
//        XCTAssert(localNotification.attachments.toUNNotificationAttachment().count == 2)
//    }
}
