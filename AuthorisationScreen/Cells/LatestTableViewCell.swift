//
//  MainTableViewCell.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 18.03.2023.
//

import Foundation
import UIKit
import SnapKit
import Combine

class LatestTableViewCell: UITableViewCell {

    var models: [LatestElement] = []
    let customColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
    
    lazy var latestCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.itemSize = CGSize(width: 130, height: 160)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = customColor
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = true
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        latestCollection.delegate = self
        latestCollection.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(latestCollection)
        latestCollection.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }

    func setup(models: [LatestElement]) {
        self.models = models
        latestCollection.reloadData()
    }
}


