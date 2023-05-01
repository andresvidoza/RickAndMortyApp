//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-09.
//

import Foundation
import UIKit

final class CharacterListViewViewModel: NSObject {
    func fetchCharacters(){
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self, completion: { result in
            switch result {
                case .success(let model):
                    print("Total: "+String(model.info.count))
                    print("Total result count "+String(model.results.count))
                case .failure(let error):
                    print(String(describing: error))
            }
        })
    }
}

extension CharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath)
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        // calculating gaps between cells
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
}
