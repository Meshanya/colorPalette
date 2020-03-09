//
//  UserPalettesViewModel.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Combine
import SwiftUI

class UserPalettesViewModel: ObservableObject {
    @Published var palettes: [Palette] = [
        Palette(name: "One", colors: [
            PaletteColor(color: Color.green), PaletteColor(color: Color.red),
            PaletteColor(color: Color.gray), PaletteColor(color: Color.yellow),
            PaletteColor(color: Color.black)
        ]),
        Palette(name: "Two", colors: [
            PaletteColor(color: Color.orange), PaletteColor(color: Color.pink),
            PaletteColor(color: Color.primary), PaletteColor(color: Color.purple),
            PaletteColor(color: Color.red)]),
        Palette(name: "Three", colors: [
            PaletteColor(color: Color.pink), PaletteColor(color: Color.yellow),
            PaletteColor(color: Color.red), PaletteColor(color: Color.orange),
            PaletteColor(color: Color.primary)])
    ]
}
