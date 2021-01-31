//
//  CapitalsApp.swift
//  Shared
//
//  Created by judongseok on 2021/01/29.
//

import SwiftUI

@main
struct CapitalsApp: App {
    @StateObject private var capital_class = capital_Class()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(capital_class)
        }
    }
}
