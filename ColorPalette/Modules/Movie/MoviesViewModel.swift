//
//  MoviesViewModel.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Combine

final class MoviesViewModel: ObservableObject {
    var movieAPI = MovieStore.shared
    
    // Input
    @Published var indexEndpoint: Int = 2
    //Output
    @Published var movies = [Movie]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $indexEndpoint
            .flatMap { (index) -> AnyPublisher<[Movie], Never> in
                self.movieAPI.fetchMovies(from: Endpoint(index: index)!)
                .replaceError(with: [])
                .eraseToAnyPublisher()
        }
        .assign(to: \.movies, on: self)
        .store(in: &cancellableSet)
    }
    
    deinit {
        for calcell in cancellableSet {
            calcell.cancel()
        }
    }
}

