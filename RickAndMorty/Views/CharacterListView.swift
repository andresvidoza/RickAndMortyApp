//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-09.
//

import UIKit

/// View that handles showing list of characters, loaders and etc.
class CharacterListView: UIView {
    
    // Get comfortable with using private variables if these are things you do not need outside this scope
    private let viewModel = CharacterListViewViewModel()
    
    // anonymous closure for the Spinner ( Assign this spinner to whatever the value of the function execution is. )
    private let spinner: UIActivityIndicatorView = {
        // Create and configure your spinner. Then return it.
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner;
    }()// invoke it
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) // adding some padding 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true; // hide by default until the data is loaded.
        collectionView.alpha = 0;
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false;
        addSubviews(collectionView, spinner)
        addConstraints()
        
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder){
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView(){
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            
            self.collectionView.isHidden = false;
            
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1;
            })
            
        })
    }

}
