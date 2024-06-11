//
//  DdokTalkApp.swift
//  DdokTalk
//
//  Created by Greed on 6/4/24.
//

import SwiftUI

@main
struct DdokTalkApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .onAppear(perform: UIApplication.shared.hideKeyboard)
        }
    }
}
