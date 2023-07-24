//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-09.
//

import Foundation
import UIKit

final class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters(){
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self, completion: { result in
            switch result {
                case .success(let model):
                print("Example image url: "+String(model.results.first?.image ?? "No Image"))
                case .failure(let error):
                    print(String(describing: error))
            }
        })
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // pass the right cell for the view model.
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        } //  cast as a cell we want.
        
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterName: "Afraz",
            characterStatus: .alive,
            characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        )
        
        cell.configure(with: viewModel)
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        // calculating gaps between cells
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
}
