//
//  ViewController+Extensions.swift
//  lab-insta-parse
//
//  Created by Charlie Hieger on 11/29/22.
//

import UIKit
import UserNotifications

extension UIViewController {

    /// Shows an alert with the given description or default text if nil.
    func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Unknown error")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    func scheduleDailyNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Daily Reminder"
        content.body = "This is your notification message."
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.hour = 11  // Customize these values
        dateComponents.minute = 31
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            }
        }
    }
}
