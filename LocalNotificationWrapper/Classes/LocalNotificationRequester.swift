import Foundation
import UserNotifications

internal class LocalNotificationRequester {

    func requestPermission() {
        if #available(iOS 10, *) {
            self.requestPermissionForiOS10()
            return
        }
        self.requestPermissionForiOS9()
    }

    @available(iOS 10.0, *)
    private func requestPermissionForiOS10() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            if error != nil {
                print("[UserNotificationCenterHelper] There was an error requesting the authorization to the user")
            } else {
                print("[UserNotificationCenterHelper] The app has authorization : \(granted)")
            }
        })
    }

    private func requestPermissionForiOS9() {
        let types : UIUserNotificationType = [UIUserNotificationType.alert, UIUserNotificationType.sound, UIUserNotificationType.badge]
        let settings = UIUserNotificationSettings(types: types, categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
    }
}
