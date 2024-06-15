//
//  WorkSpaceView.swift
//  DdokTalk
//
//  Created by Greed on 6/14/24.
//

import SwiftUI

struct WorkSpaceView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.titlePositionAdjustment = .init(horizontal: .zero, vertical: 5)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.BackgroundPrimary.ignoresSafeArea()
                initialView()
                    .sheet(isPresented: $isPresented) {
                        CreateWorkSpaceView()
                            .setSheet()
                    }
            }
            .navigationTitle("시작하기")
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
    
    private func initialView() -> some View {
        VStack(spacing: 0) {
            Text("출시 준비 완료!")
                .setFont(.title1)
                .padding(.top, 35)
            Text("님의 조직을 위해 새로운 똑톡 워크스페이스를\n시작할 준비가 완료되었어요!")
                .setFont(.body)
                .multilineTextAlignment(.center)
                .padding(.top, 24)
            Image("launching")
                .padding(.top, 15)
            Spacer()
            createWorkspaceButton()
        }
    }
    
    private func createWorkspaceButton() -> some View {
        Button {
            isPresented = true
        } label: {
            Text("워크스페이스 생성")
        }
        .buttonStyle(DTButtonStyle(size: CGSize(width: 345, height: 44), backgroundColor: Color.Point, fontColor: .white))
        .padding(.bottom, 24)
    }
    
}

#Preview {
    WorkSpaceView()
}
