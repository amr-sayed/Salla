//
//  Salla_TaskApp.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 04/09/2024.
//

import SwiftUI

@main
struct Salla_TaskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            NetworkMonitor.shared.startMonitoring()
        return true
    }
}
