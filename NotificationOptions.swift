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

public struct NotificationOptions : OptionSet {

    public var rawValue:UInt

    public init(rawValue : NotificationOptions.RawValue) {
        self.rawValue = rawValue
    }

    public static let badge = NotificationOptions(rawValue: 1)
    public static let sound = NotificationOptions(rawValue: 2)
    public static let alert = NotificationOptions(rawValue: 4)
    public static let carPlay = NotificationOptions(rawValue: 8)
}

//extension Array where Element == NotificationOption {
//
//    @available(iOS 10, *)
//    func toUNAuthorizationOptions() -> [UNAuthorizationOptions] {
//        return self.getOptions()
//    }
//
//    func toUIUserNotificationType() -> [UIUserNotificationType] {
//        return self.getOptions()
//    }
//
//    private func getOptions<T : Initializable> () -> [T] {
//        let options = self.map({ (notificationOption) -> T in
//            let option = UInt(notificationOption.rawValue)
//            return T.init(customRawValue: option)
//        })
//        return options
//    }
//}
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
