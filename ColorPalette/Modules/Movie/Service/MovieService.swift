//
//  MovieService.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation
import Combine

protocol MovieService {
    func fetchMovies(from endpoint: Endpoint, with page: Int?) -> Future<[Movie], MovieStoreAPIError>
//    func fetchMovie(id: Int) -> Future<Movie, MovieStoreAPIError>
//    func searchMovie(query: String, params: [String: String]?) -> Future<[Movie], MovieStoreAPIError>
}

public enum Endpoint: String, CustomStringConvertible, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case popular
    case topRated = "top_rated"
    
    public var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        }
    }
    

    public init?(index: Int) {
        switch index {
        case 0: self = .nowPlaying
        case 1: self = .popular
        case 2: self = .upcoming
        case 3: self = .topRated
        default: return nil
        }
    }
    
    public init?(description: String) {
        guard let first = Endpoint.allCases.first(where: { $0.description == description }) else {
            return nil
        }
        self = first
    }
    
}
