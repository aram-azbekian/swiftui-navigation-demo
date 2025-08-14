//
//  ContentView.swift
//  swiftui-navigation-demo
//
//  Created by Арам on 14.08.2025.
//

import SwiftUI

enum Tab {
    case one, two, three
}

class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab = .one
    
    init(selectedTab: Tab = .one) {
        self.selectedTab = selectedTab
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            Text("Tab Content 1")
                .tabItem { Text("One") }
                .tag(Tab.one)
            Text("Tab Content 2")
                .tabItem { Text("Two") }
                .tag(Tab.two)
            Text("Tab Content 3")
                .tabItem { Text("Three") }
                .tag(Tab.three)
        }
    }
}

#Preview {
    ContentView(viewModel: .init(selectedTab: .two))
}
