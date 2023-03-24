//
//  MainView.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 16.03.2023.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    enum Symbols {
        case grid
        case magnifyingglass
        case chevron
        
        var description: String {
            switch self {
            case .grid:
                return "text.justify"
            case .magnifyingglass:
                return "magnifyingglass"
            case .chevron:
                return "chevron.down"
            }
        }
    }
    
    let customColor: UIColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
    let searchColor: UIColor = UIColor(red: 245/255, green: 246/255, blue: 246/255, alpha: 1)
    let viewModel = MainViewModel()
    
    private lazy var navigationView: UIView = {
        let navigation = UIView()
        navigation.backgroundColor = customColor
        return navigation
    }()
    
    private lazy var leftImage: UIImageView = {
        let leftImage = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .heavy)
        leftImage.tintColor = .black
        leftImage.image = UIImage(systemName: Symbols.grid.description, withConfiguration: config)
        return leftImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        let mainString = "Trade by bata"
        let stringToColor = "bata"
        let range = (mainString as NSString).range(of: stringToColor)
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: range)
        title.attributedText = mutableAttributedString
        return title
    }()
    
    private lazy var profileImageView: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "ProfileImage")
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        picture.layer.borderWidth = 1
        picture.layer.borderColor = UIColor.black.cgColor
        picture.layer.cornerRadius = 17
        picture.layer.masksToBounds = true
        return picture
    }()
    
    private lazy var locationLabel: UILabel = {
        let location = UILabel()
        location.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        location.textAlignment = .center
        location.textColor = .gray
        location.text = "Location"
        return location
    }()
    
    private lazy var searchbar: CustomTextfield = {
        let search = CustomTextfield(fieldType: .search)
        search.backgroundColor = searchColor
        let color = UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 1)
        let placeholder = search.placeholder ?? ""
        search.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        search.layer.cornerRadius = 12
        search.textAlignment = .center
        search.font = UIFont.systemFont(ofSize: 11)
        return search
    }()
    
    private lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: Symbols.magnifyingglass.description)
        icon.tintColor = .gray
        return icon
    }()
    
    private lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
        let sfSymbol = UIImage(systemName: Symbols.chevron.description, withConfiguration: config)
        chevron.image = sfSymbol
        chevron.tintColor = .black
        return chevron
    }()
    
    lazy var categoryCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(width: 55, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        collection.backgroundColor = customColor
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false

        collection.bounces = true
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
    }
    
    private func setupElements() {
        self.addSubviews([
            navigationView,
            categoryCollection
        ])
        
        navigationView.addSubviews([
            leftImage,
            titleLabel,
            profileImageView,
            locationLabel,
            searchbar
        ])
        
        locationLabel.addSubview(chevronImage)
        searchbar.addSubview(iconImage)
        
        navigationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.top).offset(60)
            make.leading.equalTo(leftImage.snp.trailing).offset(60)
            make.trailing.equalTo(profileImageView.snp.leading).offset(-42)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.top).offset(52)
            make.leading.equalTo(titleLabel.snp.trailing).offset(42)
            make.trailing.equalTo(navigationView.snp.trailing).offset(-46)
            make.bottom.equalTo(locationLabel.snp.top).offset(-6)
        }
        
        leftImage.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(searchbar.snp.leading).offset(-10)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(6)
            make.bottom.equalTo(searchbar.snp.top).offset(-12)
            make.width.equalTo(80)
            make.height.equalTo(16)
            make.trailing.equalTo(navigationView.snp.trailing).offset(-24)
            make.centerX.equalTo(profileImageView.snp.centerX)
        }
        
        searchbar.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.top).offset(120)
            make.leading.equalTo(navigationView.snp.leading).offset(50)
            make.trailing.equalTo(navigationView.snp.trailing).offset(-50)
            make.height.equalTo(25)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.top)
            make.bottom.equalTo(locationLabel.snp.bottom)
            make.leading.equalTo(locationLabel.snp.leading).offset(66)
            make.trailing.equalTo(locationLabel.snp.trailing).offset(-3)
        }
        
        categoryCollection.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(searchbar.snp.top).offset(3)
            make.height.equalTo(19)
            make.trailing.equalTo(searchbar.snp.trailing).offset(-14)
        }
    }
}
