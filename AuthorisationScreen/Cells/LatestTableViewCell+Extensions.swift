//
//  LatestTableViewCell+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation
import UIKit

extension LatestTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseIdentifier, for: indexPath) as? LatestCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = models[indexPath.row]
        cell.apply(backgroundImage: model.imageUrl ?? "Unknown")
        cell.apply(categoryLabel: model.category ?? "Unknown" )
        cell.apply(brandLabel: model.name ?? "Unknown")
        cell.apply(priceLabel: model.price ?? 0)
        cell.layer.cornerRadius = 12
        return cell
    }
}
