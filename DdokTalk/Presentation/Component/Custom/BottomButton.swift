//
//  BottomButton.swift
//  DdokTalk
//
//  Created by Greed on 6/15/24.
//

import SwiftUI

struct BottomButton: View {
    var title: String
    var isActive: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.BackgroundPrimary
            VStack(spacing: 0) {
                Button(action: action) {
                    HStack(spacing: 8) {
                        Text(title)
                    }
                }
                .disabled(!isActive)
                .buttonStyle(DTButtonStyle(size: CGSize(width: 323, height: 44), backgroundColor: isActive ? Color.Point : Color.Inactive, fontColor: .white))
            }
            .padding(.vertical, 12)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 68)
        .ignoresSafeArea(.keyboard)
    }

}
