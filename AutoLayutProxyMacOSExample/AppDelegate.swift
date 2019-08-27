//
//  AppDelegate.swift
//  AutoLayutProxyMacOSExample
//
//  Created by Bibin Jacob Pulickal on 03/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentViewController: MainViewController())
        window?.makeKeyAndOrderFront(nil)
    }
}
