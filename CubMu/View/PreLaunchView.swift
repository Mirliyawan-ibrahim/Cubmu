//
//  PreLaunchView.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI

struct PreLaunchView: View {
    @State private var showMainView: Bool = false
    @State private var opacity: Double = 1
    var body: some View {
        Group {
            if showMainView {
                TabbarView()
            } else {
                Image("launchApp")
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
                   
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 4)) {
                opacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showMainView = true
            }
               
        }
    }
}

struct PreLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        PreLaunchView()
    }
}
