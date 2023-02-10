//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Andres Vidoza on 2023-02-09.
//

import UIKit

extension UIView {
    func addSubviews( _ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }// Variadic functions https://abhimuralidharan.medium.com/variadic-functions-swift-54ce99a55c1d
}
