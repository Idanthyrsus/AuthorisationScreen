
import Foundation
import UIKit
import SnapKit
import SDWebImage

class LatestCollectionViewCell: UICollectionViewCell, LatestCollectionViewCellProtocol {
    
   lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 8, weight: .medium)
        label.backgroundColor = UIColor(white: 8, alpha: 0.8)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        
        return label
    }()
    
   lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
     lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private lazy var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "plus")
        return imageView
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
    
    private func setupUI() {
        contentView.addSubviews([
        backgroundImageView,
        categoryLabel,
        brandLabel,
        priceLabel,
        plusImageView,
        iconImageView
        ])
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(80)
            make.leading.equalTo(contentView.snp.leading).offset(6)
            make.trailing.equalTo(contentView.snp.trailing).offset(-72)
            make.bottom.equalTo(brandLabel.snp.top).offset(-3)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceLabel.snp.top).offset(-24)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-42)
            make.top.equalTo(categoryLabel.snp.bottom).offset(3)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
            make.leading.equalTo(contentView.snp.leading).offset(12)
            make.trailing.equalTo(contentView.snp.trailing).offset(-42)
            make.top.equalTo(brandLabel.snp.bottom).offset(24)
        }
        
        plusImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(130)
            make.trailing.equalTo(contentView.snp.trailing).offset(-3)
            make.leading.equalTo(priceLabel.snp.trailing).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-6)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(plusImageView.snp.top).offset(3)
            make.bottom.equalTo(plusImageView.snp.bottom).offset(-3)
            make.leading.equalTo(plusImageView.snp.leading).offset(3)
            make.trailing.equalTo(plusImageView.snp.trailing).offset(-3)
        }
    }
}




