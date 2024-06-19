//
//  LoginViewModel.swift
//  DdokTalk
//
//  Created by Greed on 6/15/24.
//

import Foundation
import Combine

final class LoginViewModel: ViewModelType {
    
    var cancellables = Set<AnyCancellable>()
    let networkManager = NetworkManager()
    
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    
    var input = Input()
    
    @Published
    var output = Output()

    init() {
        transform()
    }
    
}

extension LoginViewModel {
    
    struct Input {
        let emailText = CurrentValueSubject<String, Never>("")
        let passwordText = CurrentValueSubject<String, Never>("")
        let loginButtonTapped = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var buttonEnable = false
        var toastMessage = ""
        var isEmailValidate = true
        var isPasswordValidate = true
    }
    
    enum Action {
        case login
    }
    
    func action(_ action: Action) {
        switch action {
        case .login:
            return input.loginButtonTapped.send(())
        }
    }
    
    func transform() {
        $emailText
            .assign(to: \.input.emailText.value, on: self)
            .store(in: &cancellables)
        
        $passwordText
            .assign(to: \.input.passwordText.value, on: self)
            .store(in: &cancellables)
        
        Publishers.CombineLatest(input.emailText, input.passwordText)
            .map { email, password in
                !email.isEmpty && !password.isEmpty
            }
            .assign(to: \.output.buttonEnable, on: self)
            .store(in: &cancellables)
        
        input.loginButtonTapped
            .throttle(for: 1, scheduler: RunLoop.main, latest: false)
            .sink { [weak self] _ in
                guard let self = self else { return }
                let email = self.input.emailText.value
                let password = self.input.passwordText.value
                
                let isEmailValid = self.validateEmail(email)
                let isPasswordValid = self.validatePassword(password)

                self.output.isEmailValidate = isEmailValid
                self.output.isPasswordValidate = isPasswordValid

                if !isEmailValid && !isPasswordValid {
                    self.output.toastMessage = "이메일 형식이 올바르지 않으며, 비밀번호는 최소 8자 이상, 하나 이상의 대소문자/숫자/특수 문자를 설정해주세요."
                } else if !isEmailValid {
                    self.output.toastMessage = "이메일 형식이 올바르지 않습니다."
                } else if !isPasswordValid {
                    self.output.toastMessage = "비밀번호는 최소 8자 이상, 하나 이상의 대소문자/숫자/특수 문자를 설정해주세요."
                } else {
                    self.login(email: email, password: password)
                }
            }
            .store(in: &cancellables)
    }
}

extension LoginViewModel {
    
    private func login(email: String, password: String) {
//        let query = LoginQuery(email: email, password: password, deviceToken: <#T##String#>)
//        networkManager.request(.authRouter(.login(query: query)), type: LoginResponse.self)
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("completed")
//                case .failure(let error):
//                    print(error)
//                }
//            } receiveValue: { response in
//                
//            }
//            .store(in: &cancellables)
    }
    
    private func validateEmail(_ email: String) -> Bool {
        if email.contains("@") && (email.contains(".com") || email.contains(".net") || email.contains(".co.kr")) {
            return true
        } else {
            return false
        }
    }
    
    private func validatePassword(_ password: String) -> Bool {
        guard password.count >= 8 else { return false }
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$"
        let passwordText = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordText.evaluate(with: password)
    }
}
