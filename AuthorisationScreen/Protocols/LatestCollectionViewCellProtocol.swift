//
//  LatestCollectionViewCellProtocol.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation

protocol LatestCollectionViewCellProtocol {
    func apply(backgroundImage: String)
    func apply(categoryLabel text: String)
    func apply(brandLabel text: String)
    func apply(priceLabel text: Int)
}
