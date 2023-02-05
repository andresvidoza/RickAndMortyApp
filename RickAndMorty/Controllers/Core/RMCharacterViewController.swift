//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-05.
//

import UIKit

// final means it cannot be subclassed

/// Controllers to show and search characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground;
        title = "Characters"
    }
    
}
