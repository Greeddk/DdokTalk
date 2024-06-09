//
//  FontWithLineHeight.swift
//  DdokTalk
//
//  Created by Greed on 6/4/24.
//

import SwiftUI

private struct FontWithLineHeight: ViewModifier {
    let fontStyle: MainFont
    
    func body(content: Content) -> some View {
        let font = fontStyle.font
        let lineHeight = fontStyle.lineHeight
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
    }
}

extension View {
    func setFont(_ fontStyle: MainFont) -> some View {
        modifier(FontWithLineHeight(fontStyle: fontStyle))
    }
}

enum MainFont {
    case title1
    case title2
    case bold
    case body
    case caption
    
    var font: UIFont {
        switch self {
        case .title1:
            return .systemFont(ofSize: 22, weight: .bold)
        case .title2:
            return .systemFont(ofSize: 14, weight: .bold)
        case .bold:
            return .systemFont(ofSize: 13, weight: .bold)
        case .body:
            return .systemFont(ofSize: 13, weight: .regular)
        case .caption:
            return .systemFont(ofSize: 12, weight: .regular)
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .title1:
            return 30
        case .title2:
            return 20
        case .bold:
            return 18
        case .body:
            return 18
        case .caption:
            return 18
        }
    }
}


