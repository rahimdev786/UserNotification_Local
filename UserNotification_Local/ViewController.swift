//
//  ViewController.swift
//  UserNotification_Local
//
//  Created by arshad on 4/26/22.
//

import UIKit
import UserNotifications

import UIKit
class ViewController: UIViewController {
    let center = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        center.requestAuthorization(options: [.sound,.alert]) { grant, err in
            self.setup()
        }
    }
    func setup(){
        let content = UNMutableNotificationContent()
        content.body = "hey its new offers"
        content.title = "From Jelsat"
        let date = Date().addingTimeInterval(1)
        let DateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents, repeats: false)
        
        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)
        
        center.add(request) { err in
            if let err = err{
                print(err.localizedDescription)
            }else{
                print("Sucesses")
            }
        }
        
    }
}

