//
//  CustomProfileCell.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomProfileCell: UITableViewCell, CustomProfileCellProtocol {
    
     lazy var iconImageView: UIImageView = {
        let iconImage = UIImageView()
        iconImage.layer.cornerRadius = 24
        iconImage.backgroundColor = .systemGray5
        iconImage.contentMode = .scaleAspectFit
        iconImage.clipsToBounds = true
        iconImage.layer.masksToBounds = true
        iconImage.tintColor = .black
        return iconImage
    }()
    
     lazy var smallIconImageView: UIImageView = {
        let iconImage = UIImageView()
        iconImage.tintColor = .black
        return iconImage
    }()
    
     lazy var categoryLabel: UILabel = {
        let label = UILabel()
        let descriptor = UIFontDescriptor(name: "Montserrat", size: 16)
        label.font = UIFont(descriptor: descriptor, size: 16)
        return label
    }()
    
     lazy var rightElementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var balanceLabel: UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        balanceLabel.frame = CGRect(x: 260, y: 20, width: 100, height: 20)
        return balanceLabel
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
        contentView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
        setupElements()
    }
    
    // MARK: - Setup elements
    
    private func setupElements() {
        contentView.addSubviews([
            iconImageView,
            categoryLabel,
            rightElementImageView
        ])
        iconImageView.addSubview(smallIconImageView)
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(6)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
            make.leading.equalTo(contentView.snp.leading).offset(3)
            make.trailing.equalTo(contentView.snp.trailing).offset(-286)
        }
        
        smallIconImageView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top).offset(10)
            make.bottom.equalTo(iconImageView.snp.bottom).offset(-10)
            make.leading.equalTo(iconImageView.snp.leading).offset(12)
            make.trailing.equalTo(iconImageView.snp.trailing).offset(-12)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(6)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        
        rightElementImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
            make.leading.equalTo(contentView.snp.leading).offset(296)
            make.trailing.equalTo(contentView.snp.trailing).offset(-3)
        }
    }
}
