//
//  TabbarView.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI

struct TabbarView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AllView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("All")
                }
                .tag(0)
            AllView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Food")
                }
                .tag(0)
            AllView()
                .tabItem {
                    Image(systemName: "play.square.fill")
                    Text("Movies")
                }
                .tag(0)
            AllView()
                .tabItem {
                    Image(systemName: "doc.plaintext.fill")
                    Text("Shop")
                }
                .tag(0)
        }
        .accentColor(.red)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
