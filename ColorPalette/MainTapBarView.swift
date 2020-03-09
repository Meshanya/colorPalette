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
            Text("The content of the second view")
                .tabItem {
                    Text("Default Palettes")
                    Image(systemName: "bandage")
                 }
            UserPalettesView().environmentObject(UserPalettesViewModel())
                .tabItem {
                    Text("Your palettes")
                    Image(systemName: "heart")
                }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTapBarView()
    }
}
