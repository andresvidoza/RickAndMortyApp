//
//  RMFooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-09-26.
//

import UIKit

class RMFooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "RMFooterLoadingCollectionReusableView"
    
    // anonymous closure for the Spinner ( Assign this spinner to whatever the value of the function execution is. )
    private let spinner: UIActivityIndicatorView = {
        // Create and configure your spinner. Then return it.
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner;
    }()// invoke it
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubviews(spinner)
        addConstraints()
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
        ])
    }
    
    public func startAnimating(){
        spinner.startAnimating()
    }
}
