//
//  MainTapBarView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct MainTapBarView: View {
    @State private var selectedTab = 0
    @State private var selectedItem: Int?
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Go to Your palettes", action: {
                self.selectedTab = 1
                self.selectedItem = 0
            })
                .tabItem {
                    Text("Default Palettes")
                    Image(systemName: "bandage")
            }.tag(0)
            UserPalettesView(selectedItem: $selectedItem).environmentObject(UserPalettesViewModel())
                .tabItem {
                    Text("Your palettes")
                    Image(systemName: "heart")
            }.tag(1)
            ModalView()
                .tabItem {
                    Text("Info")
                    Image(systemName: "info.circle")
            }.tag(2)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTapBarView()
    }
}
