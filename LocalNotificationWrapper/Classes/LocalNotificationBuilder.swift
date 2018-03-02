import Foundation
import UserNotifications

internal class LocalNotificationBuilder {

    @available(iOS 10, *)
    func build(messageBody: String) -> UNNotificationContent {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = NSString.localizedUserNotificationString(forKey: "Hey there", arguments: nil)
        notificationContent.subtitle = NSString.localizedUserNotificationString(forKey: "", arguments: nil)
        notificationContent.sound = UNNotificationSound.default()
        notificationContent.body = NSString.localizedUserNotificationString(forKey: messageBody, arguments: nil)
        notificationContent.userInfo = [:]
        return notificationContent
    }

    @available(iOS 10, *)
    func build(_ notification : LocalNotification) -> UNNotificationContent {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = NSString.localizedUserNotificationString(forKey: notification.title, arguments: nil)
        notificationContent.subtitle = NSString.localizedUserNotificationString(forKey: notification.subtitle, arguments: nil)
        notificationContent.body = NSString.localizedUserNotificationString(forKey: notification.body, arguments: nil)
        notificationContent.sound = notification.getSoundForiOS10()
        notificationContent.userInfo = notification.userInfo
        notificationContent.badge = notification.badge
        notificationContent.attachments = notification.attachments.toUNNotificationAttachment()
        notificationContent.launchImageName = notification.launchImageName
        //TO-DO Category Identifier, Thread Identifier properties.
        return notificationContent
    }


    func assemble(messageBody: String) -> UILocalNotification {
        let localNotification = UILocalNotification()
        localNotification.timeZone = TimeZone.current

        localNotification.fireDate = nil
        localNotification.alertBody = messageBody
        localNotification.hasAction = false
        return localNotification
    }

    func assemble(_ notification : LocalNotification) -> UILocalNotification {
        let localNotification = UILocalNotification()
        localNotification.alertAction = "I am a custom alert action."
        localNotification.alertTitle = notification.title
        localNotification.alertBody = notification.body
        localNotification.soundName = notification.getSoundForiOS9()
        localNotification.alertLaunchImage = notification.launchImageName
        localNotification.timeZone = TimeZone.current
        localNotification.fireDate = nil
        localNotification.hasAction = false
        //TO-DO The category identifier. Support for repeat calendar and repeat notification.
        return localNotification
    }

}
