//
//  BottomButton.swift
//  DdokTalk
//
//  Created by Greed on 6/15/24.
//

import SwiftUI

struct BottomButton: View {
    var title: String
    var backgroundColor: Color = Color.BackgroundPrimary
    var buttonColor: Color
    var action: () -> Void
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 0) {
                Button(action: action) {
                    HStack(spacing: 8) {
                        Text(title)
                    }
                }
                .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: buttonColor, fontColor: .white))
            }
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .ignoresSafeArea(.keyboard)
    }
    
    func setBackgroundColor(_ color: Color) -> some View {
        var view = self
        view.backgroundColor = color
        return view
    }
}
