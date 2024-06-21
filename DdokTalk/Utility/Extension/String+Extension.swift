//
//  String+Extension.swift
//  DdokTalk
//
//  Created by Greed on 6/21/24.
//

import Foundation

extension String {
    
    // MARK: - 휴대폰 번호 하이픈 추가 로직
    var withHypen: String {
        var stringWithHypen: String = self.filter { $0.isNumber }
        var originalNum: String = self.filter { $0.isNumber }
        
        if stringWithHypen.count > 3 {
            stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.startIndex, offsetBy: 3))
        }
        
        if stringWithHypen.count > 7 {
            let secondHyphenIndex = (stringWithHypen.count == 12) ? 8 : 7
            stringWithHypen.insert("-", at: stringWithHypen.index(stringWithHypen.startIndex, offsetBy: secondHyphenIndex))
        }
        
        if stringWithHypen.count > 13 {
            return originalNum
        }
        
        return stringWithHypen
    }
}
