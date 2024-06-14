//
//  RoundView.swift
//  DdokTalk
//
//  Created by Greed on 6/14/24.
//

import SwiftUI

struct RoundView: View {
    private var size: Size = .edit
    private var color: Color = Color.Point
    private var imageName: DefaultImageStyle?
    private var image: Image?
    @State var hasCamera = false

    init(size: Size, imageName: DefaultImageStyle) {
        self.size = size
        self.imageName = imageName
        self.image = nil
    }
    
    init(size: Size, image: Image) {
        self.size = size
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
        ZStack(alignment: .bottom) {
            if image == nil {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: size.rawValue, height: size.rawValue)
                    .foregroundStyle(color)
            }
            
            if let image = image {
                createImageView(image)
            } else if let imageName = imageName {
                createImageView(Image(imageName.rawValue))
            }
            if hasCamera {
                cameraIcon()
            }
        }
    }
    
    private func createImageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: imageName == .workspace ? 48 : size.rawValue,
                   height: imageName == .workspace ? 60 : size.rawValue)
            .clipped()
            .cornerRadius(8)
    }
    
    private func cameraIcon() -> some View {
        Image("Camera")
            .resizable()
            .frame(width: 22, height: 22)
            .offset(x: 30, y: 5)
    }
    
    func addCameraIcon() -> some View {
        var view = self
        view._hasCamera = State(initialValue: true)
        return view
    }
}

#Preview {
    Group {
        RoundView(size: .edit, imageName: .noPhoto)
        RoundView(size: .edit, imageName: .workspace)
            .addCameraIcon()
        RoundView(size: .edit, image: Image("Profile"))
            .addCameraIcon()
    }
}
