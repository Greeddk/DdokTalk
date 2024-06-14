//
//  RoundView.swift
//  DdokTalk
//
//  Created by Greed on 6/14/24.
//

import SwiftUI

struct RoundView: View {
    private var size: Size = .edit
    private var color: Color
    private var imageName: DefaultImageStyle?
    private var image: Image?

    init(size: Size, color: Color, imageName: DefaultImageStyle) {
        self.size = size
        self.color = color
        self.imageName = imageName
        self.image = nil
    }
    
    init(size: Size, color: Color, image: Image) {
        self.size = size
        self.color = color
        self.image = image
        self.imageName = nil
    }
    
    enum Size: CGFloat {
        case profile = 232
        case edit = 70
        case list = 44
        case chatroomIcon = 34
        case dmListIcon = 24
    }

    enum DefaultImageStyle: String {
        case workspace = "workspace"
        case noPhoto = "noPhoto"
    }
    
    var body: some View {
        if let image = image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: size.rawValue, height: size.rawValue)
                .clipped()
                .cornerRadius(8)
        } else if let imageName = imageName {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: size.rawValue, height: size.rawValue)
                    .foregroundStyle(color)
                Image(imageName.rawValue)
                    .resizable()
                    .frame(width: imageName == .workspace ? 48 : size.rawValue, height: imageName == .workspace ? 60 : size.rawValue)
                    .clipped()
                    .cornerRadius(8)
                if imageName == .workspace {
                    Image("Camera")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .offset(x: 30, y: 5)
                }
            }
        }
    }
}

#Preview {
    RoundView(size: .edit, color: Color.Point, imageName: .noPhoto)
}
