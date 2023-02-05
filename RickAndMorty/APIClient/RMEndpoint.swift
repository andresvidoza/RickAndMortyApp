//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation


/// Represents unique API endpoint
@frozen enum RMEndpoint: String{
    /// Endpoint to get character info
    case character // "character"
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
