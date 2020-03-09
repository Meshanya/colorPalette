//
//  PaletteRow.swift
//  ColorPalette
//
//  Created by Michael Borisov on 09.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct PaletteRow: View {
    var palette: Palette
    
    var body: some View {
        HStack() {
            Text("\(palette.name)")
            Divider()
            HStack(alignment: .center) {
                ForEach(palette.colors) { color in
                    Rectangle()
                        .fill(color.color)
                        .frame(width: 50, height: 50)
                        .cornerRadius(6)
                }
            }
        }
        .fixedSize()
    }
}

struct PaletteRow_Previews: PreviewProvider {
    static var previews: some View {
        PaletteRow(palette: Palette(name: "One", colors: [
            PaletteColor(color: Color.green), PaletteColor(color: Color.red),
            PaletteColor(color: Color.gray), PaletteColor(color: Color.yellow),
            PaletteColor(color: Color.black)
        ]))
    }
}
