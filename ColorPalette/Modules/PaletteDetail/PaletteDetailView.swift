//
//  PaletteDetailView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 08.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct PaletteDetailView: View {
    var palette: Palette
    var body: some View {
        Text(palette.name)
    }
}

struct PaletteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaletteDetailView(palette: Palette(name: "One", colors: []))
    }
}
