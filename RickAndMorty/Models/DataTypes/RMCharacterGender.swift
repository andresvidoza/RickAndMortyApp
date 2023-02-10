//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // always make sure to match strings to API so we can decode appropriately
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
