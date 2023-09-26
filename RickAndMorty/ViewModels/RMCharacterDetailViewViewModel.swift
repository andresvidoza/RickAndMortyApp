//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-09-25.
//

import Foundation

final class RMCharacterDetailViewViewModel{
    private let character: RMCharacter
    
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title: String{
        character.name.uppercased()
    }
    
    
}
