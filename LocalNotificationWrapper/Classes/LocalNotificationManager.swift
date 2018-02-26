import Foundation
import UserNotifications

public class LocalNotificationManager {

    public static let shared = LocalNotificationManager()

    private var scheduler : LocalNotificationScheduler = LocalNotificationScheduler()
    private var requester : LocalNotificationRequester = LocalNotificationRequester()

    private init() {}

    internal init(scheduler : LocalNotificationScheduler = LocalNotificationScheduler()) {
        self.scheduler = scheduler
    }

    public func requestPermission(options : [NotificationOption]) {
        self.requester.requestPermission(options: options)
    }

    internal func send(messageBody : String) {
        self.scheduler.schedule(messageBody: messageBody)
    }

    public func send(_ notification : LocalNotification) {
        self.scheduler.schedule(notification : notification)
    }

    @available(iOS 10.0, *)
    internal func send(content : UNNotificationContent) {
        self.scheduler.scheduleForiOS10(content: content)
    }

    public func heelo() {}
}
