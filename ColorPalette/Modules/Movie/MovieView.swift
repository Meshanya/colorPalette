//
//  MovieView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    @EnvironmentObject var viewModel: MoviesViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.indexEndpoint)")
            Stepper("Enter your index", value: $viewModel.indexEndpoint, in: 0...3)
                .padding()
            Picker("", selection: $viewModel.indexEndpoint) {
                ForEach(0..<4) { index in
                    Text("\(Endpoint(index: index)!.description)").tag(index)
                }
            }
                .padding()
                .pickerStyle(SegmentedPickerStyle())
            List {
                ForEach(viewModel.movies) { movie in
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
                    }
                }
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .environmentObject(MoviesViewModel())
    }
}
