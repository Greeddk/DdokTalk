//
//  OnboardingView.swift
//  DdokTalk
//
//  Created by Greed on 6/8/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showMainView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            showMainView = true
                        }
                    }
                }
            if showMainView {
                startButton()
            }
        }
    }
    
    private func SplashView() -> some View {
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
    
    private func startButton() -> some View {
        Button {
            
        } label: {
            Text("시작하기")
        }
        .buttonStyle(DTButtonStyle(size: CGSize(width: 345, height: 44), backgroundColor: Color.Point, fontColor: Color.white))
    }
    
}

#Preview {
    OnboardingView()
}
