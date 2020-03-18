//
//  MovieStore.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation
import Combine

public class MovieStore: MovieService {
    
    public static let shared = MovieStore()
    private init() {}
    private let apiKey = "0b831e8d0205a181efd325d3125b2db1"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private var subscriptions = Set<AnyCancellable>()
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func fetchMovies(from endpoint: Endpoint, with page: Int? = nil) -> Future<[Movie], MovieStoreAPIError> {
        return Future<[Movie], MovieStoreAPIError> { [unowned self] promise in
            guard let url = self.generateURL(with: endpoint, page: page) else { return promise(.failure(.urlError(URLError(URLError.unsupportedURL)))) }
            
            self.urlSession.dataTaskPublisher(for: url)
                .tryMap { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else { throw MovieStoreAPIError.responseError((response as? HTTPURLResponse)?.statusCode ?? 500) }
                    return data
            }
            .decode(type: MoviesResponse.self, decoder: self.jsonDecoder)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                if case let .failure(error) = completion {
                    switch error {
                    case let urlError as URLError:
                        promise(.failure(.urlError(urlError)))
                    case let decidongError as DecodingError:
                        promise(.failure(.decodingError(decidongError)))
                    case let apiError as MovieStoreAPIError:
                        promise(.failure(apiError))
                    default:
                        promise(.failure(.genericError))
                    }
                }
            }, receiveValue: { promise(.success($0.results)) })
                .store(in: &self.subscriptions)
        }
    }
    
    private func generateURL(with endpoint: Endpoint, page: Int?) -> URL? {
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/movie/\(endpoint.rawValue)") else {
            return nil
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let page = page {
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }

}
