import Foundation
import UserNotifications

internal class LocalNotificationScheduler {

    private let localNotificationBuilder = LocalNotificationBuilder()

    internal init() {}

    func schedule(notification : LocalNotification) {
        if #available(iOS 10, *) {
            let content = self.localNotificationBuilder.build(notification)
            self.scheduleForiOS10(content: content)
            return
        }
        let localNotification = self.localNotificationBuilder.assemble(notification)
        self.scheduleForiOS9(localNotification)
    }

    func schedule(messageBody : String) {
        if #available(iOS 10, *) {
            let content = self.localNotificationBuilder.build(messageBody: messageBody)
            self.scheduleForiOS10(content: content)
            return
        }
        let localNotification = self.localNotificationBuilder.assemble(messageBody: messageBody)
        self.scheduleForiOS9(localNotification)
    }

    @available(iOS 10, *)
    internal func scheduleForiOS10(content : UNNotificationContent) {
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("There was an error adding the notification request")
                return
            }
            print("The notification was added correctly")
        }
    }

    private func scheduleForiOS9(_ localNotification : UILocalNotification) {
        UIApplication.shared.scheduleLocalNotification(localNotification)
    }
}
