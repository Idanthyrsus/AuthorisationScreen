//
//  FlashSaleTableViewCell+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation
import UIKit

extension FlashSaleTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashsaleCollectionViewCell.reuseIdentifier, for: indexPath) as? FlashsaleCollectionViewCell else {
            return UICollectionViewCell()
        }

        let model = models[indexPath.row]
        cell.apply(backgroundImage: model.imageUrl ?? "Unknown")
        cell.apply(categoryLabel: model.category ?? "Unknown" )
        cell.apply(brandLabel: model.name ?? "Unknown")
        cell.apply(priceLabel: model.price ?? 0)
        cell.apply(discountLabel: model.discount ?? 0)
        cell.layer.cornerRadius = 12
        return cell
    }
}
