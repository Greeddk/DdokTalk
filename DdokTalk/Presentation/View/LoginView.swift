//
//  LoginView.swift
//  DdokTalk
//
//  Created by Greed on 6/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var text = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titlePositionAdjustment = .init(horizontal: .zero, vertical: 5)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.BackgroundPrimary
                    .ignoresSafeArea(.all)
                VStack {
                    inputView()
                        .padding(.top, 24)
                    Spacer()
                }
                joinButton()
            }
            .navigationTitle("이메일 로그인")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image("close")
                    }
                    .padding(.top, 8)
                }
            }
        }
    }
    
    private func inputView() -> some View {
        VStack(spacing: 24) {
            DTTextField(infoLabel: "이메일", placeHolder: "이메일을 입력하세요", text: text)
            DTTextField(infoLabel: "비밀번호", placeHolder: "비밀번호를 입력하세요", text: text)
                .makeSecureField()
        }
    }
    
    private func joinButton() -> some View {
        ZStack {
            Color.BackgroundPrimary
            VStack(spacing: 0) {
                Button {
                    // Email 로그인 액션
                } label: {
                    HStack(spacing: 8) {
                        Text("가입하기")
                    }
                }
                .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: Color.Inactive, fontColor: .white))
            }
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    LoginView()
}
