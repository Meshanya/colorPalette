//
//  MainTapBarView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct MainTapBarView: View {
    var body: some View {
        TabView {
            UserPalettesView()
                .environmentObject(UserPalettesViewModel())
                .tabItem {
                    Text("Your palettes")
                    Image(systemName: "heart")
            }
            ModalView()
                .tabItem {
                    Text("Info")
                    Image(systemName: "info.circle")
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTapBarView()
    }
}
