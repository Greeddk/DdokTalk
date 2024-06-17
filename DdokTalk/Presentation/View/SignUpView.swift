//
//  SignUpView.swift
//  DdokTalk
//
//  Created by Greed on 6/9/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
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
                BottomButton(title: "가입하기", isActive: false) {
                    
                }
            }
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
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
            DTTextField(infoLabel: "이메일", placeHolder: "이메일을 입력하세요", text: $text)
                .showButton {
                    print("hello")
                }
            DTTextField(infoLabel: "닉네임", placeHolder: "닉네임을 입력하세요", text: $text)
            DTTextField(infoLabel: "연락처", placeHolder: "전화번호를 입력하세요", text: $text)
                .keyboardType(.numberPad)
            DTTextField(infoLabel: "비밀번호", placeHolder: "비밀번호를 입력하세요", text: $text)
                .makeSecureField()
            DTTextField(infoLabel: "비밀번호 확인", placeHolder: "비밀번호를 한 번 더 입력하세요", text: $text)
                .makeSecureField()
        }
    }
    
}

#Preview {
    SignUpView()
}
