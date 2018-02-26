//
//  ViewController.swift
//  LocalNotificationWrapper
//
//  Created by ezequielg on 02/20/2018.
//  Copyright (c) 2018 ezequielg. All rights reserved.
//

import UIKit
import UserNotifications
import LocalNotificationWrapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
//        LocalNotificationManager.shared.requestPermission()
//        LocalNotificationManager.shared.requestPermission(options: [NotificationOption.badge, NotificationOption.carPlay, NotificationOption.sound])
        if #available(iOS 10, *) {

            UNUserNotificationCenter.current().requestAuthorization(options: []) { (granted, error) in
                print("Error \(error)")
                print("Granted \(granted)")


            }
        }
    }

}

