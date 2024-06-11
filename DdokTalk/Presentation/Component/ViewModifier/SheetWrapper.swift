//
//  SheetWrapper.swift
//  DdokTalk
//
//  Created by Greed on 6/11/24.
//

import SwiftUI

private struct SheetWrapper: ViewModifier {
    
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .presentationDragIndicator(.visible)
        } else {
            ZStack(alignment: .top) {
                content
                Capsule()
                    .fill(Color.secondary.opacity(0.5))
                    .frame(width: 36, height: 5)
                    .padding(.top, 6)
            }
        }
    }
}

extension View {
    func setSheet() -> some View {
        modifier(SheetWrapper())
    }
}
