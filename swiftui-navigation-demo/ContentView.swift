//
//  ContentView.swift
//  swiftui-navigation-demo
//
//  Created by Арам on 14.08.2025.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab = .one
    @Published var errorMsg: ErrorMessage?
    
    init(selectedTab: Tab = .one, errorMsg: ErrorMessage? = nil) {
        self.selectedTab = selectedTab
        self.errorMsg = errorMsg
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            VStack {
                Text("Tab Content 1")
                Button { viewModel.selectedTab = .two } label: {
                    Text("Go to Tab 2")
                }
            }
            .tabItem { Text("One") }
            .tag(Tab.one)
            
            VStack {
                Text("Tab Content 2")
                Button { viewModel.errorMsg = ErrorMessage(desc: "Unauthorized Error", actionText: "Log in") } label: {
                    Text("Present alert #1")
                }
                Button { viewModel.errorMsg = ErrorMessage(desc: "Connection lost", actionText: "Try again") } label: {
                    Text("Present alert #2")
                }
            }
            .alert(
                "Error",
                data: $viewModel.errorMsg,
                actions: { msg in
                    Button(msg.actionText) {
                        // do something
                    }
                    
                    Button("Cancel", role: .cancel) { }
                },
                message: { msg in
                    Text(msg.desc)
                })
            .tabItem { Text("Two") }
            .tag(Tab.two)
            
            Text("Tab Content 3")
                .tabItem { Text("Three") }
                .tag(Tab.three)
        }
    }
}

#Preview {
    ContentView(viewModel: .init(selectedTab: .two, errorMsg: .init(desc: "Loading failed", actionText: "Load again")))
}
