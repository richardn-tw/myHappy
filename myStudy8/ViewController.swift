//
//  ViewController.swift
//  myStudy8
//
//  Created by richardn on 2018/4/14.
//  Copyright © 2018年 richardn. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    @IBAction func showNotification(_ sender: Any) {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "測試本地通知"
        notificationContent.subtitle = "測試本地通知副標題"
        notificationContent.body = "測試本地通知 內容"
        notificationContent.badge = 1
        notificationContent.sound = UNNotificationSound.default()
        
        notificationContent.userInfo = ["direct-link": "https://www.google.com"]
        
        // image
        let imageURL: URL = Bundle.main.url(forResource: "store_logo", withExtension: "png")!
        
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
        
        notificationContent.attachments = [attachment]
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: notificationContent, trigger: trigger)
        
        
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("建立通知")
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

