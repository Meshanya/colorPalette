//
//  MoviesViewModel.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Combine

final class MoviesViewModel: ObservableObject {
    private var movieAPI = MovieStore.shared
    
    @Published var indexEndpoint: Int = 2
    @Published var movies = [Movie]()
    @Published var nextPageMovies = [Movie]()
    
    @Published private var page: Int = 1
    @Published private(set) var isPageLoading: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    private var nextPageCancellableSet: Set<AnyCancellable> = []
    
    init() {
        $indexEndpoint
            .flatMap { (index) -> AnyPublisher<[Movie], Never> in
                self.page = 0
                return self.movieAPI.fetchMovies(from: Endpoint(index: index)!)
                .replaceError(with: [])
                .eraseToAnyPublisher()
        }
        .assign(to: \.movies, on: self)
        .store(in: &cancellableSet)
    }
    
    func listItemAppears(movie: Movie) {
        if movies.isLast(movie) && !isPageLoading {
            self.page += 1
            isPageLoading = true
            movieAPI.fetchMovies(from: Endpoint(index: self.indexEndpoint)!, with: page)
                .replaceError(with: [])
                .assign(to: \.nextPageMovies, on: self)
                .store(in: &nextPageCancellableSet)
            movies += nextPageMovies
            isPageLoading = false
        }
    }
    
    deinit {
        for calcell in cancellableSet {
            calcell.cancel()
        }
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    public func isLast(_ item: Element)->Bool {
        guard isEmpty == false else {
            return false
        }
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) })  else {
            return false
        }
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
