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
        return viewModel.flashArray.value.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashsaleCollectionViewCell.reuseIdentifier, for: indexPath) as? FlashsaleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.apply(backgroundImage: viewModel.flashArray.value[indexPath.row].imageURL ?? "Unknown")
            cell.apply(categoryLabel: viewModel.flashArray.value[indexPath.row].category ?? "Unknown" )
            cell.apply(brandLabel: viewModel.flashArray.value[indexPath.row].name ?? "Unknown")
            cell.apply(priceLabel: viewModel.flashArray.value[indexPath.row].price ?? 0)
            cell.apply(discountLabel: viewModel.flashArray.value[indexPath.row].discount ?? 0)
            cell.layer.cornerRadius = 12
       return cell
    }
}
