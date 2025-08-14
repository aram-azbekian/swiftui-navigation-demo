//
//  swiftui_navigation_demoApp.swift
//  swiftui-navigation-demo
//
//  Created by Арам on 14.08.2025.
//

import SwiftUI

@main
struct swiftui_navigation_demoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(selectedTab: .three))
        }
    }
}
