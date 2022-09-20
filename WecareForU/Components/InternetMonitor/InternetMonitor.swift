//
//  InternetMonitor.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI
import Network

public class InternetMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    
    @Published public var isAvailable = true
    @Published public var showNoInternetView = false

   public init() {
        let queue = DispatchQueue(label: "com.wecare.InternetMonitor")
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isAvailable = path.status == .satisfied
                self.showNoInternetView = !self.isAvailable
            }
        }
        monitor.start(queue: queue)
    }
}
