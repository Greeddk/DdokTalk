//
//  LoginView.swift
//  DdokTalk
//
//  Created by Greed on 6/11/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = LoginViewModel()
    
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
                BottomButton(title: "로그인", isActive: viewModel.output.buttonEnable) {
                    viewModel.action(.login)
                }
            }
            .navigationTitle("이메일 로그인")
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
    
    private func inputView() -> some View {
        VStack(spacing: 24) {
            DTTextField(infoLabel: "이메일", placeHolder: "이메일을 입력하세요", text: $viewModel.emailText, isCorrect: $viewModel.output.isEmailValidate)
            DTTextField(infoLabel: "비밀번호", placeHolder: "비밀번호를 입력하세요", text: $viewModel.passwordText, isCorrect: $viewModel.output.isPasswordValidate)
                .makeSecureField()
        }
    }
    
}

#Preview {
    LoginView()
}
