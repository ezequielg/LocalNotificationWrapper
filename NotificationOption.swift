//
//  NotificationOption.swift
//  LocalNotificationWrapper
//
//  Created by Ezequiel Galindo on 2/23/18.
//

import Foundation
import UserNotifications

public enum NotificationOption : Int {

    case badge = 1
    case sound = 2
    case alert = 4
    case carPlay = 8
}

extension Array where Element == NotificationOption {

    @available(iOS 10, *)
    public func toUNAuthorizationOptions() -> UNAuthorizationOptions {
        var options :UNAuthorizationOptions = []

        for element in self {
            let authorizationOption = UNAuthorizationOptions(rawValue : UInt(element.rawValue))
            options.insert(authorizationOption)
        }
        return options
    }

    public func toUIUserNotificationTypes() -> UIUserNotificationType {
        var options :UIUserNotificationType = []

        for element in self {
            if element == .carPlay {
                continue
            }
            let notificationType = UIUserNotificationType(rawValue : UInt(element.rawValue))
            options.insert(notificationType)
        }
        return options
    }
}


