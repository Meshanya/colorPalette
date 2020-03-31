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
        NavControllerView(transition: .custom(.scale)) {
            VStack {
                Picker("", selection: self.$viewModel.indexEndpoint) {
                    ForEach(Endpoint.allCases, id: \.description) {
                        index in Text("\(index.description)").tag(index)
                    }
                }
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                List {
                    ForEach(self.viewModel.movies) { movie in
                        MovieRow(movie: movie)
                            .onAppear() {
                                self.viewModel.listItemAppears(movie: movie)
                        }
                        if self.viewModel.isPageLoading {
                            Divider()
                            Text("Loading...")
                                .padding(.vertical)
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
