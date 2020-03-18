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
                NavigationLink(destination: PaletteRow(palette: palette)) {
                    Text(palette.name)
                }
            }
            .navigationBarTitle(Text("Your Palettes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserPalettesView()
            .environmentObject(UserPalettesViewModel())
    }
}
