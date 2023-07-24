//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-26.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    // MARK - Init
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue // only care about the text
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void){
        // TODO: Abstract to Image Manager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL))) // throw error if no URL image
            return
        }
        let request = URLRequest(url: url) // make request
        
        let task = URLSession.shared.dataTask(with: request){data, _, error in
            guard let data = data, error == nil else { //unwrap multiple optionals at once the comma is an &
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
