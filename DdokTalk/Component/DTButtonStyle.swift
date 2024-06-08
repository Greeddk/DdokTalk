//
//  DTButtonStyle.swift
//  DdokTalk
//
//  Created by Greed on 6/8/24.
//

import SwiftUI

struct DTButtonStyle: ButtonStyle {
    var size: CGSize
    var backgroundColor: Color
    var fontColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        Rectangle()
            .foregroundStyle(backgroundColor)
            .frame(width: size.width, height: size.height)
            .cornerRadius(8)
            .overlay {
                configuration.label
                    .setFont(.title2)
            }
            .foregroundStyle(fontColor)
    }
    
}
