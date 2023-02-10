//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-08.
//

import Foundation

struct RMGetAllCharactersResponse: Codable{
    
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
    
}
