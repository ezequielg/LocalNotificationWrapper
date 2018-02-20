//
//  LocalNotification.swift
//  WWLocalNotification
//
//  Created by Ezequiel Galindo on 2/19/18.
//  Copyright © 2018 Ezequiel Galindo. All rights reserved.
//

import Foundation
import UserNotifications

public class LocalNotification {

    public var title: String = ""
    public var subtitle : String = ""
    public var body : String = ""
    public var launchImageName : String = ""
    public var sound : String = UILocalNotificationDefaultSoundName
    public var userInfo : [AnyHashable : Any] = [:]
    public var attachments : [Attachment] = []
    public var badge :NSNumber? = nil

    public init(title : String, subtitle : String = "", body : String) {
        self.title = title
        self.subtitle = subtitle
        self.body = body
    }

    @available(iOS 10.0, *)
    func getSoundForiOS10() -> UNNotificationSound {
        return UNNotificationSound(named: self.sound)
    }

    func getSoundForiOS9() -> String {
        return self.sound
    }
}
