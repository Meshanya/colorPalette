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
    @Binding var selectedItem: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<viewModel.palettes.count) { index in
                    NavigationLink(destination: PaletteDetailView(palette: self.viewModel.palettes[index]),
                                   tag: index,
                                   selection: self.$selectedItem) {
                        PaletteRow(palette: self.viewModel.palettes[index])
                    }
                }
            }
            .navigationBarTitle(Text("Your Palettes"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserPalettesView(selectedItem: .constant(0))
            .environmentObject(UserPalettesViewModel())
    }
}
