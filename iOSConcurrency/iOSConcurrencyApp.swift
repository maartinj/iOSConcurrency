//
//  iOSConcurrencyApp.swift
//  iOSConcurrency
//
//  Created by Marcin Jędrzejak on 17/10/2022.
//

import SwiftUI

@main
struct iOSConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
