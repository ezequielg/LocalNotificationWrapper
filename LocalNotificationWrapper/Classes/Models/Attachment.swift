//
//  Attachment.swift
//  WWLocalNotification
//
//  Created by Ezequiel Galindo on 2/19/18.
//  Copyright © 2018 Ezequiel Galindo. All rights reserved.
//

import Foundation
import UserNotifications

public class Attachment {

    var identifier : String
    var url : URL
    var type : String = ""
    var options: [AnyHashable : Any]?

    init(identifier : String, url : URL, options:  [AnyHashable : Any]?) {
        self.identifier = identifier
        self.url = url
        self.options = options
    }

    @available(iOS 10.0, *)
    internal func notificationAttachment() -> UNNotificationAttachment? {
        let notificationAttachment:UNNotificationAttachment
        do {
            notificationAttachment = try UNNotificationAttachment(identifier: self.identifier, url: self.url, options: self.options)
        } catch let error {
            print("Error creating a notification attachment \(error)")
            return nil
        }
        return notificationAttachment
    }
}

extension Array where Element : Attachment {

    @available(iOS 10.0, *)
    func toUNNotificationAttachment() -> [UNNotificationAttachment] {
        var notificationAttachment : [UNNotificationAttachment] = []
        for attachment in self {
            if let correctAttachment = attachment.notificationAttachment() {
                notificationAttachment.append(correctAttachment)
            }
        }
        return notificationAttachment
    }
}
