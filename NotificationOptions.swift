//
//  NotificationOption.swift
//  LocalNotificationWrapper
//
//  Created by Ezequiel Galindo on 2/23/18.
//

import Foundation
import UserNotifications

protocol Initializable {
    init(customRawValue : UInt)
}

//public struct NotificationOptions : OptionSet {
//
//    public var rawValue:UInt
//
//    public init(rawValue : NotificationOptions.RawValue) {
//        self.rawValue = rawValue
//    }
//
//    public static let badge = NotificationOptions(rawValue: 1)
//    public static let sound = NotificationOptions(rawValue: 2)
//    public static let alert = NotificationOptions(rawValue: 4)
//    public static let carPlay = NotificationOptions(rawValue: 8)
//
//    public static let alls = [NotificationOptions.alert, NotificationOptions.badge, NotificationOptions.sound, NotificationOptions.carPlay]
//
//
//    @available(iOS 10.0, *)
//    private func toUNAuthorizationOptions() -> UNAuthorizationOptions {
//
//        var options : UNAuthorizationOptions!
//
//        if self.contains(.alert) {
//            options.insert(UNAuthorizationOptions.alert)
//        }
//        if self.contains(.badge) {
//            options.insert(UNAuthorizationOptions.badge)
//        }
//        if self.contains(.sound) {
//            options.insert(UNAuthorizationOptions.sound)
//        }
//        if self.contains(.alert) {
//            options.insert(UNAuthorizationOptions.carPlay)
//        }
//        return UNAuthorizationOptions(rawValue : 2)
//    }
//
//    private func toUIUserNotificationType() -> UIUserNotificationType {
//        return UIUserNotificationType(rawValue : 1)
//    }
//}

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
            print("Raw value \(element.rawValue)")
            let notificationType = UIUserNotificationType(rawValue : UInt(element.rawValue))
            print("Type \(notificationType)")
            options.insert(notificationType)
        }
        return options
    }

//    private func getOptions<T : Initializable>() -> [T] {
//        let options = self.map({ (notificationOption) -> T in
//            let option = UInt(notificationOption.rawValue)
//            return T(customRawValue: option)
//        })
//        return options
//    }
}

extension UIUserNotificationType : Initializable {
    init(customRawValue: UInt) {
        self = UIUserNotificationType(rawValue : customRawValue)
    }
}

@available(iOS 10.0, *)
extension UNAuthorizationOptions : Initializable {
    init(customRawValue: UInt) {
        self = UNAuthorizationOptions(rawValue : customRawValue)
    }
}

//
//extension UIUserNotificationType : Initializable {
//        init(customRawValue: UInt) {
//            self = UIUserNotificationType(rawValue : customRawValue)
//        }
//}
//
//@available(iOS 10, *)
//extension UNAuthorizationOptions : Initializable {
//    init(customRawValue: UInt) {
//        self = UNAuthorizationOptions(rawValue : customRawValue)
//    }
//}
//
