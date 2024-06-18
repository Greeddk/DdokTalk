//
//  DTTextField.swift
//  DdokTalk
//
//  Created by Greed on 6/10/24.
//

import SwiftUI

struct DTTextField: View {
    private let infoLabel: String
    private let placeHolder: String
    private var width: CGFloat = 345
    @State private var isButton: Bool = false
    @State private var isSecureField: Bool = false
    @Binding private var text: String
    @Binding private var isValidate: Bool
    private var buttonAction: (() -> Void)? = nil
    
    init(infoLabel: String, placeHolder: String, text: Binding<String>, isCorrect: Binding<Bool>) {
        self.infoLabel = infoLabel
        self.placeHolder = placeHolder
        self._text = text
        self._isValidate = isCorrect
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(infoLabel)
                .setFont(.title2)
                .foregroundStyle(isValidate ? Color.black : Color.red)
            
            HStack(spacing: 12) {
                if isSecureField {
                    SecureField(placeHolder, text: $text)
                        .setFont(.body)
                        .frame(width: width - 24, height: 44)
                        .padding(.horizontal, 12)
                        .background(.white)
                        .cornerRadius(8)
                } else {
                    TextField(placeHolder, text: $text)
                        .setFont(.body)
                        .frame(width: width - 24, height: 44)
                        .padding(.horizontal, 12)
                        .background(.white)
                        .cornerRadius(8)
                }
               
                if isButton {
                    Button {
                        buttonAction?()
                    } label: {
                        Text("중복 확인")
                    }
                    .buttonStyle(DTButtonStyle(size: CGSize(width: 100, height: 44), backgroundColor: Color.Inactive, fontColor: .white))
                }
            }
        }
    }
    
    func showButton(action: @escaping () -> Void) -> some View {
        var view = self
        view._isButton = State(initialValue: true)
        view.width = 233
        view.buttonAction = action
        return view
    }
    
    func makeSecureField() -> some View {
        var view = self
        view._isSecureField = State(initialValue: true)
        return view
    }
    
}
