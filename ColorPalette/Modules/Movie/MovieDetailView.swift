//
//  MovieDetailView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 23.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    @State var movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Text(movie.overview)
            PopButton(destination: .previous) {
                Text("Back")
            }
        }
    }
}
