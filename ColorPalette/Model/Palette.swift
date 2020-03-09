//
//  Palette.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct Palette: Identifiable {
    var id: UUID = UUID()
    var name: String
    var colors: [PaletteColor]
}

struct PaletteColor: Identifiable {
    var color: Color
    var id: UUID = UUID()
}
