//
//  ContentView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI
import Combine

struct UserPalettesView: View {
    @EnvironmentObject var viewModel: UserPalettesViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.palettes) { palette in
                PaletteRow(palette: palette)
                NavigationLink(destination: PaletteDetailView(palette: palette)) {
                    EmptyView()
                }
            }
            .navigationBarTitle(Text("Your Palettes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserPalettesView().environmentObject(UserPalettesViewModel())
    }
}
