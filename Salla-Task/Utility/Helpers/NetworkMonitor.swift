//
//  NetworkMonitor.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 08/09/2024.
//

import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)

    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }

    var connectionType: NWInterface.InterfaceType? {
        guard isConnected else { return nil }
        return monitor.currentPath.availableInterfaces.first?.type
    }

    func startMonitoring() {
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
