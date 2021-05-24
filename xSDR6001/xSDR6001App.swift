//
//  xSDR6001App.swift
//  TestxSDRLayout
//
//  Created by Douglas Adams on 5/19/21.
//

import SwiftUI
import xClient6001

@main
struct xSDR6001App: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate

    var xSDR6001 = XSDR6001()

    var body: some Scene {
        WindowGroup {
            ContentView(radioManager: RadioManager(delegate: xSDR6001 as RadioManagerDelegate))
                .navigationTitle("xSDR6001 " + Version().string)
        }
        .windowToolbarStyle(ExpandedWindowToolbarStyle())
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // disable tab view
        NSWindow.allowsAutomaticWindowTabbing = false
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        // close when last window closed
        true
    }
}
