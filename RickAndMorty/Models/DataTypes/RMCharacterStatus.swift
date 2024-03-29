//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

enum RMCharacterStatus: String, Codable{
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    // computer property
    var text: String {
        switch self{
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
