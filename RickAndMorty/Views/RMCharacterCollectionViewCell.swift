//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-13.
//

import UIKit

/// Single cell for a character
class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        // content view is a function from cell that takes care of adding the subviews but with prioper constraints.
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        addConstraints();
    }
    
    // If you are not using storyboards, you will need to tell Xcode this.
    required init?(coder: NSCoder){
        fatalError("Unsupported")
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
    
    // every time its reused we want to reset the cell
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil;
        nameLabel.text = nil;
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel){
        
    }
    
    
    
}
