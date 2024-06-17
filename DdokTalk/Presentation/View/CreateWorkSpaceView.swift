//
//  CreateWorkSpaceView.swift
//  DdokTalk
//
//  Created by Greed on 6/14/24.
//

import SwiftUI

struct CreateWorkSpaceView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    @State var text = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titlePositionAdjustment = .init(horizontal: .zero, vertical: 5)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Color.BackgroundPrimary.ignoresSafeArea()
                inputDataView()
                BottomButton(title: "완료", isActive: true) {
                    
                }
            }
            .navigationTitle("워크스페이스 생성")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("close")
                    }
                    .padding(.top, 8)
                }
            }
        }
    }
    
    private func inputDataView() -> some View {
        VStack(spacing: 16) {
            RoundView(size: .edit, imageName: .workspace)
                .addCameraIcon()
                .padding(.top, 24)
            DTTextField(infoLabel: "워크스페이스 이름", placeHolder: "워크스페이스 이름을 입력하세요 (필수)", text: $text)
            DTTextField(infoLabel: "워크스페이스 설명", placeHolder: "워크스페이스를 설명하세요 (옵션)", text: $text)
                .padding(.top, 8)
            Spacer()
        }
    }
}

#Preview {
    CreateWorkSpaceView()
}
