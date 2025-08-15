//
//  View+alert.swift
//  swiftui-navigation-demo
//
//  Created by Арам on 15.08.2025.
//

import SwiftUI

extension View {
    @ViewBuilder func alert<T, A: View, M: View>(
        _ title: String,
        data: Binding<T?>,
        @ViewBuilder actions: @escaping (T) -> A,
        @ViewBuilder message: @escaping (T) -> M
    ) -> some View {
        self.alert(
            title,
            isPresented: Binding<Bool>(
                get: { data.wrappedValue != nil },
                set: { newVal in if !newVal { data.wrappedValue = nil } }
            ),
            presenting: data.wrappedValue,
            actions: actions,
            message: message
        )
    }
}
