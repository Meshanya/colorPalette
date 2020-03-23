//
//  MovieStoreAPIError.swift
//  ColorPalette
//
//  Created by Michael Borisov on 18.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import Foundation

enum MovieStoreAPIError: Error, LocalizedError {
    case urlError(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case genericError
    
    var localizedDescription: String {
        switch self {
        case .urlError(let error):
            return error.localizedDescription
        case .decodingError(let error):
            return error.localizedDescription
        case .responseError(let status):
            return "Bad response code: \(status)"
        case .genericError:
            return "An unknown error has been occured"
        }
    }
}
