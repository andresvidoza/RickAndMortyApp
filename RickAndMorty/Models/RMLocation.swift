//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import Foundation

struct RMLocation: Codable {
    
      let id: Int
      let name: String
      let type: String
      let dimension: String
      let residents: [String]
      let url: String
      let created: String
    
}
