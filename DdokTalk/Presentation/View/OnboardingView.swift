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
    @State private var showBottomSheet = false
    @State private var showSignUpView = false
    @State private var showLoginView = false
    
    var body: some View {
        VStack(spacing: 0) {
            SplashView()
            .popup(isPresented: $showBottomSheet) {
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
            .sheet(isPresented: $showSignUpView) {
                SignUpView()
                    .setSheet()
            }
            .sheet(isPresented: $showLoginView) {
                LoginView()
                    .setSheet()
            }
        }
    }
    
    private func SplashView() -> some View {
        ZStack(alignment: .bottom) {
            Color.BackgroundPrimary
                .ignoresSafeArea(.all)
            VStack {
                Spacer().frame(height: 93)
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
            .ignoresSafeArea()
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
    
    private func startButton() -> some View {
        Button {
            showBottomSheet = true
        } label: {
            Text("시작하기")
        }
        .buttonStyle(DTButtonStyle(size: CGSize(width: 345, height: 44), backgroundColor: Color.Point, fontColor: Color.white))
    }
    
    private func bottomSheet() -> some View {
        ZStack {
            Color.BackgroundPrimary
                .cornerRadius(10)
                .ignoresSafeArea()
            authButtons()
        }
    }
    
    private func authButtons() -> some View {
        VStack(spacing: 0) {
            Capsule()
                .fill(Color.secondary.opacity(0.5))
                .frame(width: 36, height: 5)
                .padding(.top, 6)
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
                    self.showBottomSheet = false
                    self.showLoginView = true
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
                        self.showBottomSheet = false
                        self.showSignUpView = true
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

#Preview {
    OnboardingView()
}
