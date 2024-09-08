//
//  ContentView.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 04/09/2024.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            NetworkMonitor.shared.startMonitoring()
        return true
    }
}

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some View {
        NavigationView {
            BrandDetailsView()
        }
    }
}

#Preview {
    ContentView()
}
