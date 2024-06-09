//
//  OnboardingView.swift
//  DdokTalk
//
//  Created by Greed on 6/8/24.
//

import SwiftUI
import PopupView

struct OnboardingView: View {
    @State private var showMainView = false
    @State private var isPresented = false
    
    var body: some View {
        VStack {
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
            .popup(isPresented: $isPresented) {
                bottomSheet()
                    .frame(height: 290)
            } customize: {
                $0
                    .type(.toast)
                    .position(.bottom)
                    .appearFrom(.bottom)
                    .animation(.spring)
                    .dragToDismiss(true)
                    .backgroundColor(.black.opacity(0.5))
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
            isPresented = true
        } label: {
            Text("시작하기")
        }
        .buttonStyle(DTButtonStyle(size: CGSize(width: 345, height: 44), backgroundColor: Color.Point, fontColor: Color.white))
    }
    
    private func bottomSheet() -> some View {
        ZStack {
            Color.white
                .cornerRadius(10)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Image("Indicator")
                    .padding(.top, 16)
                
                VStack(spacing: 16) {
                    Button {
                        // Apple 로그인 액션
                    } label: {
                        HStack(spacing: 8) {
                            Image("Apple")
                            Text("Apple로 계속하기")
                        }
                    }
                    .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: .black, fontColor: .white))
                    
                    Button {
                        // Kakao 로그인 액션
                    } label: {
                        HStack(spacing: 8) {
                            Image("Kakao")
                            Text("카카오톡으로 계속하기")
                        }
                    }
                    .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: .kakaoYello, fontColor: .black))
                    
                    Button {
                        // Email 로그인 액션
                    } label: {
                        HStack(spacing: 8) {
                            Image("Email")
                            Text("이메일로 계속하기")
                        }
                    }
                    .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: Color.Point, fontColor: .white))
                    
                    HStack(spacing: 4) {
                        Text("또는")
                        Button {
                            // 회원가입 액션
                        } label: {
                            Text("새롭게 회원가입 하기")
                        }
                        .foregroundStyle(Color.Point)
                    }
                    .setFont(.title2)
                }
                .padding(.top, 25)
                
                Spacer()
            }
            .padding(.bottom, 16)
        }
    }

    
}

#Preview {
    OnboardingView()
}
