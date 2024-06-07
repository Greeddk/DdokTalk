//
//  SplashView.swift
//  DdokTalk
//
//  Created by Greed on 6/4/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Text("""
                 똑톡을 사용하면 어디서나
                 팀을 모을 수 있습니다
                """)
            .multilineTextAlignment(.center)
            .setFont(.title1)
            Spacer().frame(height: 89)
            Image("onboarding")
            Spacer()
        }
    }
}

#Preview {
    SplashView()
}
