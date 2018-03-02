import Foundation
import UserNotifications

internal class LocalNotificationRequester {

    func requestPermission(options : [NotificationOption] = []) {
        if #available(iOS 10, *) {
            self.requestPermissionForiOS10With(options)
            return
        }
        self.requestPermissionForiOS9With(options)
    }

    @available(iOS 10.0, *)
    private func requestPermissionForiOS10With(_ options :[NotificationOption]) {
        UNUserNotificationCenter.current().requestAuthorization(options: options.toUNAuthorizationOptions(), completionHandler: { (granted, error) in
            if error != nil {
                print("[UserNotificationCenterHelper] There was an error requesting the authorization to the user")
            } else {
                print("[UserNotificationCenterHelper] The app has authorization : \(granted)")
            }
        })
    }

    private func requestPermissionForiOS9With(_ options : [NotificationOption]) {
        let types : UIUserNotificationType = [UIUserNotificationType.alert, UIUserNotificationType.sound, UIUserNotificationType.badge]
        let settings = UIUserNotificationSettings(types: options.toUIUserNotificationTypes(), categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
    }
}
