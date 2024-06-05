//
//  Color+Extension.swift
//  DdokTalk
//
//  Created by Greed on 6/4/24.
//

import SwiftUI

extension Color {
    static let Point = Color(hex: "4AC645")
    static let Error = Color(hex: "E9666B")
    static let Inactive = Color(hex: "AAAAAA")
    
    static let TextPrimary = Color(hex: "1C1C1C")
    static let TextSecondary = Color(hex: "606060")
    
    static let BackgroundPrimary = Color(hex: "F6F6F6")
    static let BackgroundSecondary = Color(hex: "FFFFFF")
    
    static let ViewSeperator = Color(hex: "ECECEC")
    static let ViewAlpha = Color(hex: "000000").opacity(0.5)
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
