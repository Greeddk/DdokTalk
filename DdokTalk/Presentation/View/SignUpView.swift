//
//  SignUpView.swift
//  DdokTalk
//
//  Created by Greed on 6/9/24.
//

import SwiftUI

struct SignUpView: View {
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
                ScrollView(.vertical, showsIndicators: false) {
                    inputInfoViews()
                        .padding(.top, 24)
                    Spacer().frame(height: 60)
                }
                joinButton()
            }
            .navigationTitle("회원가입")
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
    
    private func inputInfoViews() -> some View {
        VStack(spacing: 24) {
            DTTextField(infoLabel: "이메일", placeHolder: "이메일을 입력하세요", text: text)
                .showButton {
                    print("hello")
                }
            DTTextField(infoLabel: "닉네임", placeHolder: "닉네임을 입력하세요", text: text)
            DTTextField(infoLabel: "연락처", placeHolder: "전화번호를 입력하세요", text: text)
                .keyboardType(.numberPad)
            DTTextField(infoLabel: "비밀번호", placeHolder: "비밀번호를 입력하세요", text: text)
                .makeSecureField()
            DTTextField(infoLabel: "비밀번호 확인", placeHolder: "비밀번호를 한 번 더 입력하세요", text: text)
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
    SignUpView()
}
