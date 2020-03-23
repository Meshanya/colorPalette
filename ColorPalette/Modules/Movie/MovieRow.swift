//
//  MovieRow.swift
//  ColorPalette
//
//  Created by Michael Borisov on 23.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    @State var movie: Movie
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(movie.title)").font(.title)
                HStack {
                    Text("\(movie.releaseDate)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    Text("\(movie.overview)")
                        .lineLimit(3)
                }
            }
            PushButton(destination: MovieDetailView(movie: movie)) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
            }
        }
    }
}
