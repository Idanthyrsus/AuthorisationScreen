//
//  CategoryCollectionViewCell.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell, CategoryCollectionCellProtocol {
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 18
        icon.backgroundColor = .systemGray5
        icon.contentMode = .scaleAspectFit
        icon.layer.masksToBounds = true
        icon.clipsToBounds = true
        return  icon
    }()
    
    lazy var smallIconImageView: UIImageView = {
       let iconImage = UIImageView()
       iconImage.tintColor = .black
       return iconImage
   }()
    
     lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 7, weight: .bold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupUI() {
        contentView.addSubviews([
            iconImage,
            categoryLabel
        ])
        
        iconImage.addSubview(smallIconImageView)
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom).offset(-14)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        smallIconImageView.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.top).offset(6)
            make.bottom.equalTo(iconImage.snp.bottom).offset(-6)
            make.leading.equalTo(iconImage.snp.leading).offset(6)
            make.trailing.equalTo(iconImage.snp.trailing).offset(-6)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
            make.leading.equalTo(contentView.snp.leading).offset(2)
            make.trailing.equalTo(contentView.snp.trailing).offset(-2)
        }
    }
}
