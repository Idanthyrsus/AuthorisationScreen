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
        return viewModel.latestArray.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseIdentifier, for: indexPath) as? LatestCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.apply(backgroundImage: viewModel.latestArray.value[indexPath.row].imageURL ?? "Unknown")
            cell.apply(categoryLabel: viewModel.latestArray.value[indexPath.row].category ?? "Unknown" )
            cell.apply(brandLabel: viewModel.latestArray.value[indexPath.row].name ?? "Unknown")
            cell.apply(priceLabel: viewModel.latestArray.value[indexPath.row].price ?? 0)
            cell.layer.cornerRadius = 12
       return cell
    }
}
